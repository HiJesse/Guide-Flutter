import 'package:flutter/services.dart';

// method channel 管理器
class MethodChannelManager {
  // 设备信息channel
  static const String CHANNEL_DEVICE_INFO = 'channel_device_info';
  static const String METHOD_GET_DEVICE_ID = 'method_get_device_id';

  /// 获取设备id
  static Future getDeviceID() async {
    return MethodChannel(CHANNEL_DEVICE_INFO)
        .invokeMethod(METHOD_GET_DEVICE_ID);
  }
}
