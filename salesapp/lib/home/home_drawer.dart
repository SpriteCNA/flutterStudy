import 'package:flutter/material.dart';
import 'package:salesapp/main/public.dart';

class HomeDrawerScene extends StatelessWidget {
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
              new Container(
                width: 64,
                height: 64,
                child: new Image.asset(''),
              ),
              new SizedBox(width: 10,),
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text(
                        '左小青',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 20, color: SAColor.textBlack,
                        ),
                      ),
                      new GestureDetector(
                        onTap: () => {},
                        child: new Image.asset(
                          '',
                          width: 80,
                          height: 20,
                        ),
                      )
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
          shrinkWrap: true ,
          primary: false,
          children: List.generate(12, (index) {
            return gridItemWidget(index);
          }),
        )
      ],
    );
  }

  Widget gridItemWidget(index) {
    return new Container(
      width: 60,
      height: 50,
      child: new Column(
        children: <Widget>[
          new Image.asset(_gridItemImgUrl[index], width: 20, height: 20,),
          new SizedBox(height: 10,),
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
