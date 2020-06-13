import 'package:flutter/material.dart';
import 'package:guide_flutter/page/router.dart';
import 'package:guide_flutter/util/timer_util.dart';

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
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Router.push(context, Router.HOME,
                      finishCurrentPage: true),
                  child: Text('跳过',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '($_count)',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
