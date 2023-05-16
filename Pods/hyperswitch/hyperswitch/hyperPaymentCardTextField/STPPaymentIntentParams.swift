//
//  STPPaymentIntentParams.swift
//  hyperswitch
//
//  Created by Harshit Srivastava on 10/05/23.
//

import Foundation
import UIKit

public class STPPaymentIntentParams: NSObject {
    
    public init(clientSecret: String) {
        self.clientSecret = clientSecret
        super.init()
    }
    
    public var clientSecret: String = ""
    @objc public var paymentMethodParams: STPPaymentMethodParams?
    
    public func description() -> [String:Any?] {
        let props: [String:Any?] = [
            "publishableKey": STPAPIClient.shared.publishableKey ?? "",
            "stripeAccountId": "",
            "clientSecret": self.clientSecret,
            "paymentMethodType": "Card",
            "paymentMethodData": ""
        ]
        return props
    }
}
