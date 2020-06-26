import 'package:flutter/services.dart';

/// 设备信息channel
class MethodDeviceInfoChannel {
  static const String CHANNEL_DEVICE_INFO = 'channel_device_info';

  static const String METHOD_GET_DEVICE_ID = 'method_get_device_id';

  /// 获取设备id
  /// return String
  static Future getDeviceID() {
    return MethodChannel(CHANNEL_DEVICE_INFO)
        .invokeMethod(METHOD_GET_DEVICE_ID);
  }
}
