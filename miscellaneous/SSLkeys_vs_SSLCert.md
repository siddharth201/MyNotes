The core difference between the two approaches lies in what part of the identity you hardcode into your app. Certificate Pinning trusts the exact certificate file, while Public Key Pinning (HPKP style) trusts only the cryptographic key pair inside that certificate. [1, 2, 3] 
Here is a direct comparison overview:

| Feature | Certificate Pinning | Public Key Pinning (Your Code) |
|---|---|---|
| What is pinned | The entire SSL certificate (.cer or .der file data). | Just the public key hash inside the certificate. |
| When it breaks | Every time the certificate is renewed (even with the same key). | Only if you generate a brand-new private/public key pair. |
| Maintenance | High (Requires frequent app updates or remote config updates). | Low (Keys can outlive certificates for years). |
| Security Level | Maximum (Strict identity match). | High (Flexible, but protects against rogue Certificate Authorities). |

------------------------------
## Code Examples
Both methods use the exact same URLSessionDelegate lifecycle. The difference is entirely inside Step 3 and 4 where you extract and compare the data. [4] 
## Option A: Certificate Pinning
This method checks if the certificate data presented by the server matches a local certificate file bundled directly into your app binary. [5, 6] 

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

## Option B: Public Key Pinning
This is the approach from your original code. Instead of matching the whole certificate file, it strips away the certificate metadata (expiration dates, signatures, issuer details) and hashes only the public key bits. [7, 8, 9, 10, 11] 

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

------------------------------
## Which one should you use?
Most production modern mobile apps prefer Public Key Pinning because: [12] 

   1. No App Store Emergency Updates: Standard SSL certificates expire every 90 days to 1 year. If you use Certificate Pinning, you must push an app update every year before the old certificate expires. If users don't update, their app breaks. [13, 14, 15, 16] 
   2. Key Reuse: When your ops team renews your website's SSL certificate, they can choose to keep the same private/public key pair (re-signing it with a new validity date). With Public Key Pinning, your app continues working smoothly without any changes. [17, 18, 19, 20] 



