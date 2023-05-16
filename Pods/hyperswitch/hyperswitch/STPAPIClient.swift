//
//  STPAPIClient.swift
//  hyperswitch
//
//  Created by Shivam Shashank on 23/03/23.
//

import Foundation
import UIKit

@objc public class STPAPIClient: NSObject {
    
    @objc(sharedClient) public static let shared: STPAPIClient = {
        let client = STPAPIClient()
        return client
    }()
    
    @objc public var publishableKey: String? = ""
}
