#if canImport(Braintree)
    import Braintree
    import SwiftUI

    class PayPalHandler: NSObject {
        
        var rnMessage: String
        var rnCallback: RCTResponseSenderBlock!
        var apiClient: BTAPIClient!
        var payPalNativeCheckoutClient: BTPayPalNativeCheckoutClient!
        
        init(rnMessage: String, rnCallback: @escaping RCTResponseSenderBlock){
            self.rnMessage = rnMessage
            self.rnCallback = rnCallback
            self.apiClient = BTAPIClient(authorization: rnMessage)!
            self.payPalNativeCheckoutClient = BTPayPalNativeCheckoutClient(apiClient: apiClient)
        }
        
        func startPayment() {
            let request = BTPayPalNativeVaultRequest()
            guard let payPalNativeCheckoutClient = payPalNativeCheckoutClient else {
                rnCallback([["error": "Unable to initialise payPalNativeCheckoutClient"]])
                return
            }
            
            payPalNativeCheckoutClient.tokenizePayPalAccount(with: request) { payPalNativeCheckoutNonce, error in
                if let payPalNativeCheckoutNonce = payPalNativeCheckoutNonce {
                    self.rnCallback([
                        ["paymentMethodData": payPalNativeCheckoutNonce.nonce]
                    ])
                }
                else if let error = error {
                    if error.localizedDescription == "PayPal flow was canceled by the user." {
                        self.rnCallback([["error": "User has canceled"]])
                    } else {
                        self.rnCallback([["error": error.localizedDescription]])
                    }
                }
            }
        }
    }
#endif

