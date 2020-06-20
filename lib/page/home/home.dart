import 'package:flutter/material.dart';
import 'package:guide_flutter/page/home/communication.dart';
import 'package:guide_flutter/page/home/native_view.dart';
import 'package:guide_flutter/page/home/update.dart';

/// 首页 带底部导航
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // 底部item列表
  final List<BottomNavigationBarItem> _navigationItem = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      title: Text("通讯"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      title: Text("原生UI"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      title: Text("升级"),
    ),
  ];
  // 嵌套页面
  final pages = [CommunicationPage(), NativeViewPage(), UpdatePage()];
  // 当前选中index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItem,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  // 切换页面
  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
