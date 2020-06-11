import 'package:flutter/material.dart';
import 'package:guide_flutter/page/splash.dart';
import 'package:guide_flutter/util/string_util.dart';

/// 路由管理
class Router {
  static const SPLASH = 'flutter://splash';
  static const HOME = 'flutter://home';

  /// 将路由表映射成具体的页面
  static Widget _parseWidget(String url, dynamic params) {
    Widget widget;

    if (StringUtil.isEmpty(url)) {
      widget = Text('error');
    } else if (url.startsWith('http://') || url.startsWith('https://')) {
      widget = Text('web');
    }

    switch (url) {
      case SPLASH:
        {
          widget = SplashPage();
          break;
        }
      case HOME:
        {
          widget = Text('home');
          break;
        }
    }

    return widget;
  }

  /// 路由页面
  /// context, 页面路径, {是否关闭当前页面, 参数}
  static void push(BuildContext context, String url,
      {bool finishCurrentPage = false, dynamic params}) {
    if (StringUtil.isEmpty(url)) {
      return;
    }

    if (finishCurrentPage) {
      pop(context);
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _parseWidget(url, params)));
  }

  // 退出当前页面
  static void pop(BuildContext context) => Navigator.pop(context);
}
