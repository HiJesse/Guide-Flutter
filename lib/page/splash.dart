import 'package:flutter/material.dart';
import 'package:guide_flutter/page/router.dart';
import 'package:guide_flutter/util/timer_util.dart';
import 'package:guide_flutter/widget/linear_layout.dart';
import 'package:guide_flutter/widget/text_view.dart';

/// 闪屏页
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _count;
  TimerUtil _timerUtil;

  _SplashPageState() {
    _count = 3000;
    _timerUtil = TimerUtil(_count);
    _timerUtil.setTickListener((counterDuration, currentTick) {
      setState(() => _count = currentTick);
      if (currentTick == 0) {
        Router.push(context, Router.HOME, finishCurrentPage: true);
      }
    });
    _timerUtil.startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '闪屏页',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  decoration: TextDecoration.none),
            ),
          ),
          LinearLayout(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 10),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(
                '跳过',
                textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 5),
                onTap: () => Router.push(context, Router.HOME, finishCurrentPage: true),
              ),
              TextView(
                '($_count)',
                textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
