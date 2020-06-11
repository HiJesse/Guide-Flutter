import 'package:flutter/material.dart';
import 'package:guide_flutter/page/router.dart';

// 闪屏页
class SplashPage extends StatelessWidget {
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
            margin: const EdgeInsets.all(5),
            child: FlatButton(
              child: Text('跳过',
                  style: TextStyle(fontSize: 12, color: Colors.black)),
              onPressed: () =>
                  Router.push(context, Router.HOME, finishCurrentPage: true),
            ),
          )
        ],
      ),
    );
  }
}
