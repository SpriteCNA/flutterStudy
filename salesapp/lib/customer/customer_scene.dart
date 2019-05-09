import 'package:flutter/material.dart';
import 'package:salesapp/login/login_scene.dart';
class CustomerScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text('客户')
      ),
      body: new Container(
        child: new FlatButton(onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScene()));
        }, child: new Text('退出登录'))
      ),
    );
  }
}