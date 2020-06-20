import 'package:flutter/services.dart';

/// basic message channel 处理器
class BasicChannelManager {
  static const String CHANNEL_TOAST = 'channel_toast';

  /// toast信息
  /// toast信息, {是否为长toast}
  static void sendToast(String message, {bool longDuration = false}) {
    const basicMessageChannel =
        const BasicMessageChannel(CHANNEL_TOAST, StandardMessageCodec());
    basicMessageChannel
        .send({'message': message, 'longDuration': longDuration});
  }

  static void send() {
    const basicMessageChannel =
        const BasicMessageChannel('basic_channel', StringCodec());
    basicMessageChannel.setMessageHandler(
      (String message) => Future<String>(() {
        print(message);
        return "回复native消息";
      }),
    );

    basicMessageChannel.send("来自flutter的message");
  }
}
