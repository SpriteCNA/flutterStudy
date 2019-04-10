import 'package:salesapp/main/public.dart';
import 'package:flutter/material.dart';

enum HomeAppointCellCategory {
  HomeAppointCellCategoryMaintain, //保养
  HomeAppointCellCategoryService //维修
}

class HomeSenseAppointCell extends StatelessWidget {
  final String timestamp;
  //时间
  final String appointContent;
  //预约内容
  final String appointInitiator;
  //预约人
  final String appointCarInfo;
  //预约车辆信息
  final String serviceConsultantName;
  //服务顾问
  final HomeAppointCellCategory cellCategory;
  //cell的类型
  HomeSenseAppointCell(
      {this.timestamp,
      this.appointContent,
      this.appointInitiator,
      this.appointCarInfo,
      this.serviceConsultantName,
      this.cellCategory});

  @override
  Widget build(BuildContext context) {
    final String maintainTitle = this.cellCategory ==
            HomeAppointCellCategory.HomeAppointCellCategoryMaintain
        ? '保养'
        : '维修';
    final String maintainImageName = this.cellCategory ==
            HomeAppointCellCategory.HomeAppointCellCategoryMaintain
        ? 'img/maintain_item.png'
        : 'img/service_item.png';

    return new Container(
      margin: new EdgeInsets.all(10),
      width: Screen.width - 20,
      height: 168,
      decoration: new BoxDecoration(
          border: new Border.all(width: 0.1, color: SAColor.textBlack),
          borderRadius: new BorderRadius.all(new Radius.circular(4))),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 16,
          ), //顶部留白
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new SizedBox(
                    width: 15,
                  ),
                  new Image.asset(
                    maintainImageName,
                    width: 20,
                    height: 20,
                  ),
                  new SizedBox(
                    width: 10,
                  ),
                  new Text(
                    maintainTitle,
                    style:
                        new TextStyle(fontSize: 16, color: SAColor.textBlack),
                  ),
                ],
              ),
              rightItemWidget(),
            ],
          ),
          new Column(
            children: <Widget>[
              new SizedBox(height: 10,),
              new Row(
                children: <Widget>[
                  new SizedBox(width: 15,),
                  new Text(
                    '预约内容:',
                    style: new TextStyle(
                        fontSize: 13, color: SAColor.textLightBlack),
                  ),
                  new SizedBox(width: 15,),
                  new Text(
                    this.appointContent,
                    style:
                        new TextStyle(fontSize: 13, color: SAColor.textBlack),
                  )
                ],
              ),
              new SizedBox(height: 10,),
              new Row(
                children: <Widget>[
                  new SizedBox(width: 15,),
                  new Text('预约人:',
                      style: new TextStyle(
                          fontSize: 13, color: SAColor.textLightBlack)),
                  new SizedBox(width: 26,),
                  new Text(
                    this.appointInitiator,
                    style:
                        new TextStyle(fontSize: 13, color: SAColor.textBlack),
                  )
                ],
              ),
              new SizedBox(height: 10,),
              new Row(
                children: <Widget>[
                  new SizedBox(width: 15,),
                  new Text(
                    '车辆信息:',
                    style: new TextStyle(
                        fontSize: 13, color: SAColor.textLightBlack),
                  ),
                  new SizedBox(width: 15,),
                  new Text(
                    this.appointCarInfo,
                    style:
                        new TextStyle(fontSize: 13, color: SAColor.textBlack),
                  )
                ],
              )
            ],
          ),
          new SizedBox(height: 10,),
          new Container(
            margin: new EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: new Divider(height: 0.5, color: SAColor.dividerLine),
          ),
          new SizedBox(height: 8,),
          bottomItemWidget()
        ],
      ),
    );
  }

  Widget rightItemWidget() {
    if (this.cellCategory ==
        HomeAppointCellCategory.HomeAppointCellCategoryMaintain) {
      return new Row(
        children: <Widget>[
          new Text(this.timestamp,
              style: new TextStyle(fontSize: 12, color: SAColor.textBlack)),
          new SizedBox(width: 10,),
          new Image.asset('img/cell_more.png'),
          new SizedBox(
            width: 15,
          )
        ],
      );
    } else {
      return new Row(
        children: <Widget>[
          new Text(this.timestamp,
              style: new TextStyle(fontSize: 12, color: SAColor.textBlack)),
          new SizedBox(
            width: 15,
          )
        ],
      );
    }
  }

  Widget bottomItemWidget() {
    if (this.cellCategory ==
        HomeAppointCellCategory.HomeAppointCellCategoryMaintain) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new GestureDetector(
            child: new Row(
              children: <Widget>[
                new Image.asset('img/item_sms.png', width: 15, height: 15,),
                new SizedBox(width: 10,),
                new Text(
                  '发送信息',
                  style: new TextStyle(fontSize: 13, color: SAColor.textBlack),
                )
              ],
            ),
            onTap: () {},
          ),
          new Container(
            width: 0.1,
            height: 15,
            color: SAColor.textLightBlack
          ),
          new GestureDetector(
            child: new Row(
              children: <Widget>[
                new Image.asset('img/item_call.png', width: 15, height: 15),
                new SizedBox(width: 10,),
                new Text(
                  '拨打电话',
                  style: new TextStyle(fontSize: 13, color: SAColor.textBlack),
                )
              ],
            ),
            onTap: () {},
          ),
        ],
      );
    } else {
      return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new SizedBox(width: 15,),
          new Text(
            '服务顾问:',
            style: new TextStyle(fontSize: 13, color: SAColor.textLightBlack),
          ),
          new SizedBox(width: 15,),
          new Text(
            this.serviceConsultantName,
            style: new TextStyle(fontSize: 13, color: SAColor.textBlack),
          )
        ],
      );
    }
  }
}
