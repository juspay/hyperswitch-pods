#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(TestConnectNative, RCTEventEmitter)

RCT_EXTERN_METHOD(sendMessageToNative: (NSString)rnMessage)
RCT_EXTERN_METHOD(sendCallbackToNative: (RCTResponseSenderBlock)rnCallback)
RCT_EXTERN_METHOD(dismissViewController: (nonnull NSNumber *)reactTag)
RCT_EXTERN_METHOD(launchApplePay: (NSString)rnMessage :(RCTResponseSenderBlock)rnCallback)
RCT_EXTERN_METHOD(exitCardForm: (NSString)rnMessage)
RCT_EXTERN_METHOD(exitPaymentsheet: (NSString)rnMessage)
RCT_EXTERN_METHOD(launchPayPal: (NSString)rnMessage :(RCTResponseSenderBlock)rnCallback)
RCT_EXTERN_METHOD(launchKount: (NSString)rnMessage :(RCTResponseSenderBlock)rnCallback)

@end
