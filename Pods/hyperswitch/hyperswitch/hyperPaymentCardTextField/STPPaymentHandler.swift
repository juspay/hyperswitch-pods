//
//  STPPaymentHandler.swift
//  hyperswitch
//
//  Created by Harshit Srivastava on 10/05/23.
//

public class STPPaymentHandler: NSObject {
    
    @objc public static let sharedHandler: STPPaymentHandler = STPPaymentHandler()
    @objc var completion: STPPaymentHandlerActionPaymentIntentCompletionBlock?
    @objc public class func shared() -> STPPaymentHandler {
        return STPPaymentHandler.sharedHandler
    }
    public init(apiClient: STPAPIClient = .shared)
    {
        self.apiClient = apiClient
        super.init()
    }
    public var apiClient: STPAPIClient
    
    @objc(confirmPayment:withAuthenticationContext:completion:)
    public func confirmPayment(
        _ paymentParams: STPPaymentIntentParams,
        with authenticationContext: UIViewController,
        completion: @escaping STPPaymentHandlerActionPaymentIntentCompletionBlock
    )
    {
        self.completion = completion
        
        RNViewManager.sharedInstance.responseHandler = self
        TestConnectNative.shared?.confirm(data: paymentParams.description())
    }
    public typealias STPPaymentHandlerActionPaymentIntentCompletionBlock = (
        STPPaymentHandlerActionStatus, STPPaymentIntent?, NSError?
    ) -> Void
    
    @objc public enum STPPaymentHandlerActionStatus: Int {
        case succeeded
        case canceled
        case failed
    }
}

public class STPPaymentIntent: NSObject {
    
}

extension STPPaymentHandler: RNResponseHandler {
    func didReceiveResponse(response: String?, error: Error?) {
        if let completion = completion {
            if let error = error {
                completion(.failed, nil, error as NSError)
            }
            else if response == "canceled" {
                completion(.canceled, nil, nil)
            }
            else if response != nil {
                completion(.succeeded, nil, nil)
            }
        }
    }
}