import 'dart:async';

import 'package:flutter/services.dart';

export 'src/ShadowText.dart';

class AuroShadowText {
  static const MethodChannel _channel = const MethodChannel('auro_shadow_text');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
