import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:salesapp/main/public.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeDrawerScene extends StatefulWidget {
  @override
  HomeDrawerSceneState createState() => HomeDrawerSceneState();
}

class HomeDrawerSceneState extends State<HomeDrawerScene> {
  final List<String> _gridItemTitle = [
    '首页',
    '客源',
    '潜客',
    '订单',
    '任务',
    '预约',
    '审批',
    '通知',
    '阳光易手车',
    '新能源车库存',
    '工具箱',
    '设置'
  ];

  final List<String> _gridItemImgUrl = [
    'img/home_item.png',
    'img/leads_item.png',
    'img/pepole_item.png',
    'img/order_item.png',
    'img/task_item.png',
    'img/appoint_item.png',
    'img/aduit_item.png',
    'img/notice_item.png',
    'img/deal_item.png',
    'img/new_car.png',
    'img/tool_item.png',
    'img/set_item.png'
  ];

  File _image;

  Future getImageByCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageByGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          width: Screen.width,
          padding: EdgeInsets.only(top: 72),
          height: 150,
          child: new Row(
            children: <Widget>[
              new SizedBox(width: 10),
              new GestureDetector(
                onTap: () => {_showDialog(context)},
                child: new Container(
                  width: 64,
                  height: 64,
                  child: _image == null ? Text('NO Image selected') : Image.file(_image),
                ),
              ),
              new SizedBox(width: 10,),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(height: 12,),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        '左小青',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 20,
                          color: SAColor.textBlack,
                        ),
                      ),
                      new SizedBox(width: 40,),
                      new GestureDetector(
                          onTap: () => {}, child: new Text('个人资料'))
                    ],
                  ),
                  new Text(
                    '上海申银汽车服务有限公司',
                    textAlign: TextAlign.left,
                    style:
                        new TextStyle(fontSize: 13, color: SAColor.textBlack),
                  )
                ],
              )
            ],
          ),
        ),
        new Divider(
          height: 1,
        ),
        new GridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          children: List.generate(12, (index) {
            return gridItemWidget(index);
          }),
        )
      ],
    );
  }

  void _showDialog(BuildContext cxt) {
    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          var dialog = CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt);
                }, child: new Text('取消')),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt);
                    getImageByCamera();
                  },
                  child: Text('拍照')),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt);
                    getImageByGallery();
                  },
                  child: Text('从相册中选择')),
            ],
          );
          return dialog;
        });
  }

  Widget gridItemWidget(index) {
    return new Container(
      width: 60,
      height: 50,
      child: new Column(
        children: <Widget>[
          new Image.asset(
            _gridItemImgUrl[index],
            width: 20,
            height: 20,
          ),
          new SizedBox(
            height: 10,
          ),
          new Text(
            _gridItemTitle[index],
            style: new TextStyle(
              color: SAColor.textBlack,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
