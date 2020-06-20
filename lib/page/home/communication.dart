import 'package:flutter/material.dart';
import 'package:guide_flutter/platform/channel/basic_channel_manager.dart';
import 'package:guide_flutter/widget/linear_layout.dart';
import 'package:guide_flutter/widget/text_view.dart';

/// flutter 跟原生通讯 示例
class CommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      direction: Axis.vertical,
      children: <Widget>[
        TextView(
          'BaseChannel',
          margin: const EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 15),
        ),
        TextView(
          '通讯',
          onTap: () => BasicChannelManager.sendToast('flutter'),
        ),
      ],
    );
  }
}
