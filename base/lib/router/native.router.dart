import 'package:flutter/services.dart';

class NativeRouter {
  static const platform = const MethodChannel('nativeRouter');

  static Future<void> route(String url) async {
    try {
      await platform.invokeMethod('route', url);
    } on PlatformException catch (e) {
      print('NativeRouter route error $e');
    }
  }
}
