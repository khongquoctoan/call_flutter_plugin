import 'dart:async';
import 'package:flutter/services.dart';
import 'package:call_flutter_plugin/callkit/call_module.dart';
import 'package:call_flutter_plugin/graph/graph_module.dart';

class CallFlutterPlugin {
  static const MethodChannel _channel =
      MethodChannel('flutter_call_flutter_plugin_method_channel');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static GraphModule graphModule = GraphModule.instance;
  static CallModule callModule = CallModule.instance;
}
