import 'package:flutter/services.dart';

/// 设备安全channel
class MethodSecurityChannel {
  static const String CHANNEL_SECURITY = 'channel_security';

  static const String METHOD_ENCODE_STRING = 'method_encode_string';

  /// 提供多种encode 编码字符串
  /// 字符串, md5, base64
  /// return map {src: , md5 : , base64: }
  static Future encodeString(String src,
      {bool md5 = false, bool base64 = false}) {
    return MethodChannel(CHANNEL_SECURITY).invokeMapMethod(METHOD_ENCODE_STRING,
        {'src': src, 'md5Enable': md5, 'base64Enable': base64});
  }
}
