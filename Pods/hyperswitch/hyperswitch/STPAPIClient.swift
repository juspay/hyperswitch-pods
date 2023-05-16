//
//  STPAPIClient.swift
//  hyperswitch
//
//  Created by Harshit Srivastava on 14/07/23.
//

import Foundation
import UIKit

@objc public class STPAPIClient: NSObject {
    
    @objc(sharedClient) public static let shared: STPAPIClient = {
        let client = STPAPIClient()
        return client
    }()
    
    @objc public var publishableKey: String? {
        get {
            if let publishableKey = _publishableKey {
                return publishableKey
            }
            return StripeAPI.defaultPublishableKey
        }
        set {
            _publishableKey = newValue
        }
    }
    var _publishableKey: String?
}
