import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:salesapp/home/home_scene.dart';
import 'package:salesapp/customer/customer_scene.dart';
import 'package:salesapp/task/task_scene.dart';
import 'package:salesapp/appoint/appoint_scene.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
    Image.asset('img/home.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomeScene(),
          TaskScene(),
          AppointScene(),
          CustomerScene(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: new Text('首页')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: new Text('任务')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: new Text('预约')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: new Text('客户')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
