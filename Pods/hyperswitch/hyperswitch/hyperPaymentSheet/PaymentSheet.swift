//
//  PaymentSheet.swift
//  hyperswitch
//
//  Created by Balaganesh on 09/12/22.
//

import Foundation

@frozen public enum PaymentSheetResult {
    case completed
    case canceled
    case failed(error: Error)
}

public class PaymentSheet {
    
    public let configuration: Configuration
    
    public required init(paymentIntentClientSecret: String, configuration: Configuration) {
        self.intentClientSecret = paymentIntentClientSecret
        self.configuration = configuration
    }
    
    let intentClientSecret: String
    var completion: ((PaymentSheetResult) -> ())?
}

extension PaymentSheet: RNResponseHandler {
    func didReceiveResponse(response: String?, error: Error?) {
        if let completion = completion {
            if let error = error {
                completion(.failed(error: error))
            }
            else if (response == "canceled"){
                completion(.canceled)
            }
            else if (response != nil) {
                completion(.completed)
            }
        }
    }
}

