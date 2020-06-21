import 'package:flutter/services.dart';

/// basic message channel 处理器
class BasicChannelManager {
  static const String CHANNEL_TOAST = 'channel_toast';
  static const String CHANNEL_APP_INFO = 'channel_app_info';

  static const String KEY_TAOST_MESSAGE = 'message';
  static const String KEY_TAOST_DURATION = 'longDuration';

  /// toast信息
  /// toast信息, {是否为长toast}
  static void toast(String message, {bool longDuration = false}) {
    BasicMessageChannel(CHANNEL_TOAST, StandardMessageCodec())
        .send({KEY_TAOST_MESSAGE: message, KEY_TAOST_DURATION: longDuration});
  }

  static const String KEY_APP_INFO_APP_VERSION_NAME = 'appVersionName';
  static const String KEY_APP_INFO_APP_VERSION_CODE = 'appVersionCode';
  static const String KEY_APP_INFO_FLUTTER_VERSION_NAME = 'flutterVersionName';
  static const String KEY_APP_INFO_FLUTTER_VERSION_CODE = 'flutterVersionCode';

  /// 获取原生app信息
  static Future getPlatformAppInfo() {
    return BasicMessageChannel(CHANNEL_APP_INFO, StandardMessageCodec())
        .send(Map());
  }
}
