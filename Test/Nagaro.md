
<details>
<summary><b>Q.1 Have you worked on any banking or BFSI domain application?</b></summary>

Yes, I have worked on BFSI-related features, particularly in the Credit Card and UPI domains.

In the Credit Card domain, I was involved in the customer onboarding journey, where users could apply for a credit card through the application.

The onboarding process started with collecting the customer's PAN card details. We then performed customer verification using third-party services or SDK integrations, such as KERSA, to validate customer information.

After verification, the application determined whether the customer was an Existing to Bank (ETB) or New to Bank (NTB) customer.

- **ETB (Existing to Bank):** These are customers who already have a relationship with the bank. The bank may already have their KYC and personal details, which can be retrieved through backend services.
- **NTB (New to Bank):** These are new customers who are required to provide additional personal and KYC-related information during onboarding.

Once the required customer information was collected, we sent it to the bank's eligibility API. Based on the customer's profile and eligibility criteria, the bank's backend determined which credit card variants or products were available to that customer.

The application then displayed the eligible credit card options to the customer.

</details>
