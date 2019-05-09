import 'package:flutter/material.dart';
import 'package:salesapp/main/public.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class LoginScene extends StatefulWidget {
  @override
  LoginSceneState createState() => LoginSceneState();
}

class LoginSceneState extends State<LoginScene> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  bool _isLoading = false;
  bool _loginBtnEnable = true;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return Scaffold(
        backgroundColor: SAColor.white,
        body: new Container(
            padding: new EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: new SingleChildScrollView(
                controller: _scrollController,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _loginTextWidget(),
                    new SizedBox(height: 50),
                    _inputViewsWidget(),
                    _bottomActionsWidget()
                  ],
                ))),
      );
    } else {
      return Scaffold(
          backgroundColor: SAColor.white,
          body: new IndexedStack(
            index: 1,
            children: <Widget>[
              new Container(
                  padding: new EdgeInsets.fromLTRB(30, 80, 30, 0),
                  child: new SingleChildScrollView(
                      controller: _scrollController,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _loginTextWidget(),
                          new SizedBox(height: 50),
                          _inputViewsWidget(),
                          _bottomActionsWidget()
                        ],
                      ))),
              SpinKitCircle(
                color: SAColor.blue,
                size: 80.0,
              )
            ],
          ));
    }
  }

  Widget _loginTextWidget() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          '登录',
          style: new TextStyle(fontSize: 36, color: SAColor.textTitleColor),
        ),
        new Text(
          '欢迎来到大众e销',
          style: new TextStyle(fontSize: 18, color: SAColor.textLightBlack),
        )
      ],
    );
  }

  Widget _inputViewsWidget() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _inputView(
            '用户名',
            Icon(
              Icons.people,
              size: 20,
            ),
            false,
            _userNameController),
        new SizedBox(
          height: 15,
        ),
        _inputView(
            '密码',
            Icon(
              Icons.lock,
              size: 20,
            ),
            true,
            _passWordController)
      ],
    );
  }

  Widget _bottomActionsWidget() {
    return new Container(
      padding: new EdgeInsets.only(top: 40),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new GestureDetector(
            onTap: () => {},
            child: new Text(
              '忘记密码',
              style: new TextStyle(fontSize: 13, color: SAColor.blue),
            ),
          ),
          _loginActionWidget()
        ],
      ),
    );
  }

  Widget _loginActionWidget () {
    if (!this._loginBtnEnable) {
      return new Text('登录');
    }else {
     return new FlatButton(
          disabledColor: SAColor.gray,
          onPressed: () => {
          countDown(),
          this.setState(() {
            _isLoading = true;
          })
          },
          child: new Text('登录'));
    }
  }

  void countDown() {
     new Timer.periodic(new Duration(seconds: 2), (timer) {
       this.setState(()=> {
         _isLoading = false
       });
       Toast.show('登录成功');
       Navigator.pop(context);
     });
  }

  Widget _inputView(String helpText, Icon leftIcon, bool securityInput,
      TextEditingController controller) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            leftIcon,
            new SizedBox(width: 15),
            new Container(
                width: Screen.width * 0.6,
                height: 40,
                child: new Theme(
                  data: new ThemeData(
                      primaryColor: SAColor.white, hintColor: SAColor.white),
                  child: new TextField(
                    obscureText: securityInput,
                    controller: controller,
                    enableInteractiveSelection: false,
                    decoration: new InputDecoration(
                        hintText: helpText,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    autofocus: false,
                  ),
                ))
          ],
        ),
        new Divider(
          height: 1,
          color: SAColor.textLightBlack,
        )
      ],
    );
  }
}
