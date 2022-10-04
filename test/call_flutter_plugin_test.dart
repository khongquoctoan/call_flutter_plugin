// import 'package:flutter_test/flutter_test.dart';
// import 'package:call_flutter_plugin/call_flutter_plugin.dart';
// import 'package:call_flutter_plugin/call_flutter_plugin_platform_interface.dart';
// import 'package:call_flutter_plugin/call_flutter_plugin_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockCallFlutterPluginPlatform 
//     with MockPlatformInterfaceMixin
//     implements CallFlutterPluginPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final CallFlutterPluginPlatform initialPlatform = CallFlutterPluginPlatform.instance;

//   test('$MethodChannelCallFlutterPlugin is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelCallFlutterPlugin>());
//   });

//   test('getPlatformVersion', () async {
//     CallFlutterPlugin CallFlutterPlugin = CallFlutterPlugin();
//     MockCallFlutterPluginPlatform fakePlatform = MockCallFlutterPluginPlatform();
//     CallFlutterPluginPlatform.instance = fakePlatform;
  
//     expect(await CallFlutterPlugin.getPlatformVersion(), '42');
//   });
// }
