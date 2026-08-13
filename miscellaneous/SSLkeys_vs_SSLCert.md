The core difference between the two approaches lies in what part of the identity you hardcode into your app. Certificate Pinning trusts the exact certificate file, while Public Key Pinning (HPKP style) trusts only the cryptographic key pair inside that certificate. 
Here is a direct comparison overview:

| Feature | Certificate Pinning | Public Key Pinning (Your Code) |
|---|---|---|
| What is pinned | The entire SSL certificate (.cer or .der file data). | Just the public key hash inside the certificate. |
| When it breaks | Every time the certificate is renewed (even with the same key). | Only if you generate a brand-new private/public key pair. |
| Maintenance | High (Requires frequent app updates or remote config updates). | Low (Keys can outlive certificates for years). |
| Security Level | Maximum (Strict identity match). | High (Flexible, but protects against rogue Certificate Authorities). |


## Code Examples
Both methods use the exact same URLSessionDelegate lifecycle. The difference is entirely inside Step 3 and 4 where you extract and compare the data. [4] 
## Option A: Certificate Pinning
This method checks if the certificate data presented by the server matches a local certificate file bundled directly into your app binary. 

```swift
import Foundation
class CertificatePinningDelegate: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // 1. Ensure we are validating the server's trust
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        // 2. Extract the raw server certificate data
        guard let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data
        
        // 3. Load your trusted certificate file bundled inside your app
        guard let localCertificatePath = Bundle.main.path(forResource: "my_server_cert", ofType: "cer"),
              let localCertificateData = try? Data(contentsOf: URL(fileURLWithPath: localCertificatePath)) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 4. Compare the entire certificate binary blob
        if serverCertificateData == localCertificateData {
            print("✅ Certificate Pinning Passed!")
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            print("❌ Certificate Pinning Failed!")
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
```

## Option B: Public Key Pinning
This is the approach from your original code. Instead of matching the whole certificate file, it strips away the certificate metadata (expiration dates, signatures, issuer details) and hashes only the public key bits. 

```swift
import Foundationimport CryptoKit
class PublicKeyPinningDelegate: NSObject, URLSessionDelegate {
    
    // Hardcoded hash string instead of an embedded file
    private let pinnedPublicKeyHash = "ORgYmF...your-unique-base64-hash...="
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        // 1. Strip the certificate away to copy ONLY the public key
        guard let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0),
              let publicKey = SecCertificateCopyKey(certificate),
              let publicKeyData = SecKeyCopyExternalRepresentation(publicKey, nil) as Data? else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 2. Hash just the public key data
        let hash = SHA256.hash(data: publicKeyData)
        let serverHashBase64 = Data(hash).base64EncodedString()
        
        // 3. Compare hashes
        if serverHashBase64 == pinnedPublicKeyHash {
            print("✅ Public Key Pinning Passed!")
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            print("❌ Public Key Pinning Failed!")
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
```

## Which one should you use?
Most production modern mobile apps prefer Public Key Pinning because: [12] 

   1. No App Store Emergency Updates: Standard SSL certificates expire every 90 days to 1 year. If you use Certificate Pinning, you must push an app update every year before the old certificate expires. If users don't update, their app breaks. [13, 14, 15, 16] 
   2. Key Reuse: When your ops team renews your website's SSL certificate, they can choose to keep the same private/public key pair (re-signing it with a new validity date). With Public Key Pinning, your app continues working smoothly without any changes. [17, 18, 19, 20] 

---  

## Q. How to implement a backup pin setup so your app doesn't break if your server's primary key ever needs to be revoked in an emergency?

To implement a backup pin setup, you include multiple hardcoded hashes in your app. One is your active production key (Primary), and the others are offline keys kept in a secure vault (Backups). [1, 2] 
If your primary server key is compromised, your operations team can immediately deploy one of the backup keys to the server. Because the app already recognizes that backup hash, it continues working without needing an emergency App Store update. [3] 
## The Implementation Strategy

   1. Primary Pin: Matches the public key currently live on your production server.
   2. Backup Pin(s): Matches a completely different public key/private key pair generated in advance. This key pair is never deployed anywhere until an emergency happens. [4] 


## Code Implementation
Here is how to modify your delegate to support an array of allowed pins:

```swift
import Foundationimport CryptoKit
class SecureSessionDelegate: NSObject, URLSessionDelegate {
    
    // 1. Maintain a list of trusted hashes instead of just one
    private let allowedPublicKeyHashes = [
        "ORgYmF...primary-active-key-hash...=",  // Primary (Currently live on server)
        "b3A8Xz...backup-key-hash-one......=",  // Backup 1 (Stored safely offline)
        "z9K1wP...backup-key-hash-two......="   // Backup 2 (Stored safely offline)
    ]
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // 2. Validate Server Trust
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        // 3. Extract the server's public key
        guard let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0),
              let publicKey = SecCertificateCopyKey(certificate),
              let publicKeyData = SecKeyCopyExternalRepresentation(publicKey, nil) as Data? else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 4. Hash the server's public key
        let hash = SHA256.hash(data: publicKeyData)
        let serverHashBase64 = Data(hash).base64EncodedString()
        
        // 5. Check if the server's hash exists in our list of allowed pins
        if allowedPublicKeyHashes.contains(serverHashBase64) {
            print("✅ SSL Pinning Passed! Matched a valid key.")
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            print("❌ SSL Pinning Failed! Unrecognized public key.")
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
```


## Step-by-Step Emergency Rotation Workflow
To make this setup actually work, your team must follow these operational rules:

* Step 1 (Setup): Your DevOps team generates two or three separate private/public key pairs.
* Step 2 (Pinning): You extract the SHA-256 Base64 hash for all of them and add them to the allowedPublicKeyHashes array in the iOS app.
* Step 3 (Deployment): You deploy Key Pair #1 to your live server. You download Key Pair #2 and #3, put them in a password manager or physical vault, and delete them from the server environment.
* Step 4 (The Emergency): If your server is breached, your DevOps team revokes Certificate #1. They pull Key Pair #2 out of the vault, issue a new SSL certificate using it, and install it on the web server.
* Step 5 (No Downtime): The next time your app connects, it sees the server is using Key #2. The app's logic finds Key #2 in the allowedPublicKeyHashes list, accepts it, and the users experience zero interruption.

Would you like help with the OpenSSL terminal commands needed to generate these backup keys and extract their Base64 hashes correctly?

