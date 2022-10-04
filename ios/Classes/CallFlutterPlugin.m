#import "CallFlutterPlugin.h"
#if __has_include(<call_flutter_plugin/call_flutter_plugin-Swift.h>)
#import <call_flutter_plugin/call_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "call_flutter_plugin-Swift.h"
#endif

@implementation CallFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCallFlutterPlugin registerWithRegistrar:registrar];
}
@end
