//
//  PaymentSheetConfiguration.swift
//  hyperswitch
//
//  Created by Balaganesh on 09/12/22.
//

import Foundation
import PassKit

extension PaymentSheet {
    
    /// Style options for colors in PaymentSheet
    @available(iOS 13.0, *)
    public enum UserInterfaceStyle: Int, DictionaryConverter {
        
        /// (default) PaymentSheet will automatically switch between standard and dark mode compatible colors based on device settings
        case automatic = 0
        
        /// PaymentSheet will always use colors appropriate for standard, i.e. non-dark mode UI
        case alwaysLight
        
        /// PaymentSheet will always use colors appropriate for dark mode UI
        case alwaysDark
        
        func configure(_ viewController: UIViewController) {
            switch self {
            case .automatic:
                break  // no-op
                
            case .alwaysLight:
                viewController.overrideUserInterfaceStyle = .light
                
            case .alwaysDark:
                viewController.overrideUserInterfaceStyle = .dark
            }
        }
    }
    
    public enum SavePaymentMethodOptInBehavior: DictionaryConverter {
        /// (Default) The SDK will apply opt-out behavior for supported countries.
        /// Currently, this behavior is supported in the US.
        case automatic
        
        /// The control will always default to unselected and users
        /// will have to explicitly interact to save their payment method
        case requiresOptIn
        
        /// The control will always default to selected and users
        /// will have to explicitly interact to not save their payment method
        case requiresOptOut
        
        var isSelectedByDefault: Bool {
            switch self {
            case .automatic:
                // only enable the save checkbox by default for US
                return Locale.current.regionCode == "US"
            case .requiresOptIn:
                return false
            case .requiresOptOut:
                return true
            }
        }
    }
    
    public struct Configuration: DictionaryConverter {
        
        public var allowsDelayedPaymentMethods: Bool = false
        public var allowsPaymentMethodsRequiringShippingAddress: Bool = false
        // public var apiClient: STPAPIClient
        
        public var applePay: ApplePayConfiguration? = nil
        
        //Doubt1 -> newValue
        public var primaryButtonColor: UIColor? {
            set {
                appearance.primaryButton.backgroundColor = newValue
            }
            
            get {
                return appearance.primaryButton.backgroundColor
            }
        }
        
        public var primaryButtonLabel: String?
        
        private var styleRawValue: Int = 0
        
        @available(iOS 13.0, *)
        public var style: UserInterfaceStyle {  // stored properties can't be marked @available which is why this uses the styleRawValue private var
            get {
                return UserInterfaceStyle(rawValue: styleRawValue)!
            }
            set {
                styleRawValue = newValue.rawValue
            }
        }
        
        public var customer: CustomerConfiguration? = nil
        public var merchantDisplayName: String = ""
        public var returnURL: String? = nil
        // some default billing and shipping details
        public var defaultBillingDetails: BillingDetails = BillingDetails()
        public var shippingDetails: BillingDetails = BillingDetails() // Any changes in shipping details struct would require a separate struct
        public var savePaymentMethodOptInBehavior: SavePaymentMethodOptInBehavior = .automatic
        
        public var appearance = PaymentSheet.Appearance.default
        //public var shippingDetails: () -> AddressViewController.AddressDetails? = { return nil }
        public init() {}
    }
    
    public struct CustomerConfiguration: DictionaryConverter {
        public let id: String
        
        /// A short-lived token that allows the SDK to access a Customer's payment methods
        public let ephemeralKeySecret: String
        
        /// Initializes a CustomerConfiguration
        public init(id: String, ephemeralKeySecret: String) {
            self.id = id
            self.ephemeralKeySecret = ephemeralKeySecret
        }
    }
    /// Configuration related to Apple Pay
    public struct ApplePayConfiguration {
        public let merchantId: String
        public let merchantCountryCode: String
        public let buttonType: PKPaymentButtonType
        public let paymentSummaryItems: [PKPaymentSummaryItem]?
        
        /// Optional handler blocks for Apple Pay
        public let customHandlers: Handlers?
        
        /// Custom handler blocks for Apple Pay
        public struct Handlers {
            public let paymentRequestHandler: ((PKPaymentRequest) -> PKPaymentRequest)?
            
            public let authorizationResultHandler: ((PKPaymentAuthorizationResult, ((PKPaymentAuthorizationResult) -> Void)) -> Void)?
            
            /// Initializes the ApplePayConfiguration Handlers.
            public init(paymentRequestHandler: ((PKPaymentRequest) -> PKPaymentRequest)? = nil, authorizationResultHandler: ((PKPaymentAuthorizationResult, ((PKPaymentAuthorizationResult) -> Void)) -> Void)? = nil) {
                self.paymentRequestHandler = paymentRequestHandler
                self.authorizationResultHandler = authorizationResultHandler
            }
        }
        
        /// Initializes a ApplePayConfiguration
        public init(
            merchantId: String,
            merchantCountryCode: String,
            buttonType: PKPaymentButtonType = .plain,
            paymentSummaryItems: [PKPaymentSummaryItem]? = nil,
            customHandlers: Handlers? = nil
        ) {
            self.merchantId = merchantId
            self.merchantCountryCode = merchantCountryCode
            self.buttonType = buttonType
            self.paymentSummaryItems = paymentSummaryItems
            self.customHandlers = customHandlers
        }
    }
    
    public struct Address: Equatable, DictionaryConverter {
        /// City, district, suburb, town, or village.
        /// - Note: The value set is displayed in the payment sheet as-is. Depending on the payment method, the customer may be required to edit this value.
        public var city: String?
        public var country: String?
        public var line1: String?
        public var line2: String?
        public var postalCode: String?
        public var state: String?
        
        /// Initializes an Address
        public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postalCode: String? = nil, state: String? = nil) {
            self.city = city
            self.country = country
            self.line1 = line1
            self.line2 = line2
            self.postalCode = postalCode
            self.state = state
        }
    }
    
    public struct BillingDetails: Equatable, DictionaryConverter {
        /// The customer's billing address
        public var address: Address?
        public var email: String?
        public var name: String?
        public var phone: String?
        
        /// Initializes the BillingDetails
        public init(address: Address? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
            self.address = address
            self.email = email
            self.name = name
            self.phone = phone
        }
    }
}

