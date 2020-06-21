import 'package:flutter/material.dart';
import 'package:guide_flutter/platform/channel/basic_channel_manager.dart';
import 'package:guide_flutter/util/check_util.dart';
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
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 15),
        ),
        LinearLayout(
          margin: EdgeInsets.only(left: 10, right: 10),
          children: <Widget>[
            TextView(
              '调用原生',
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.grey,
              onTap: () => BasicChannelManager.toast('flutter'),
            ),
            TextView('调用原生并回调',
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.grey,
                margin: EdgeInsets.only(left: 5),
                onTap: () => BasicChannelManager.getPlatformAppInfo()
                    .then((value) => this._basicChannelAppInfo(value))),
          ],
        ),
      ],
    );
  }

  /// 获取app信息回调
  void _basicChannelAppInfo(Map map) {
    if (CheckUtil.isMapEmpty(map)) {
      return;
    }

    String msg = 'app 版本: ' +
        map[BasicChannelManager.KEY_APP_INFO_APP_VERSION_NAME] +
        ' ' +
        map[BasicChannelManager.KEY_APP_INFO_APP_VERSION_CODE] +
        ' flutter 版本: ' +
        map[BasicChannelManager.KEY_APP_INFO_FLUTTER_VERSION_NAME] +
        ' ' +
        map[BasicChannelManager.KEY_APP_INFO_FLUTTER_VERSION_CODE];

    BasicChannelManager.toast(msg);
  }
}
