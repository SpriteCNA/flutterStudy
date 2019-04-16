import 'package:flutter/material.dart';
//import 'package:salesapp/app/app_scene.dart;
//import 'package:flutter/services.dart';
import 'package:salesapp/main/public.dart';
import 'package:salesapp/home/homeStaticsItem.dart';
import 'package:salesapp/home/home_appoint_cell.dart';
import 'package:salesapp/home/Home_Task_Card.dart';
import 'package:salesapp/home/home_drawer.dart';
class HomeScene extends StatefulWidget {
  State<StatefulWidget> createState() => HomeSceneState();
}

class HomeSceneState extends State<HomeScene> with RouteAware {
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;
  List<String> _itemTitles = [
    '新增订单',
    '订单成交率',
    '新增客户',
    '新增客源',
  ];
  List<String> _itemCounts = [
    '3260',
    '3270',
    '3280',
    '3290',
  ];
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var offSet = scrollController.offset;
      if (offSet < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offSet < 50) {
        setState(() {
          navAlpha = 1 - (50 - offSet) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
            right: 0,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
              child: buildAction(SAColor.white),
            )),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            color: SAColor.blue,
            child: Row(
              children: <Widget>[
                new GestureDetector(
                  onTap: () => {
                    Scaffold.of(context).openDrawer(),
                  },
                  child: new Image.asset('img/my_menu.png', width: 40, height: 56,),
                ),
                Expanded(
                  child: Text(
                    '首页',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: SAColor.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildAction(SAColor.white),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildAction(Color iconColor) {
    return Row(
      children: <Widget>[
        Container(
          height: kToolbarHeight,
          width: 40,
          child: Image.asset(
            'img/search_icon.png',
            color: iconColor,
          ),
        ),
        Container(
          height: kToolbarHeight,
          width: 40,
          child: Image.asset(
            'img/add_icon.png',
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }

  Widget buildStatusHead() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Container(
              height: 261,
              child: Image.asset('img/buble_background.png'),
            ),
            new SizedBox(
              height: 25,
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new Container(
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new Image.asset(
                    'img/item_circle.png',
                    width: 150,
                    height: 94,
                  ),
                  new Column(
                    children: <Widget>[
                      new Text('43',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                      new Text(
                        '待审批',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            new SizedBox(height: 25,),
            new Container(
              height: 90,
              margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(6), right: Radius.circular(6)),
                  border: Border.all(color: SAColor.white, width: 0.5),
                  color: SAColor.white),
              child: new Row(
                children: <Widget>[
                  HomeTaskCard(
                    cardTitle: '保养预约',
                    cardCount: '271',
                    unfinishedCount: '12',
                  ),
                  HomeTaskCard(
                    cardTitle: '预约跟进',
                    cardCount: '86',
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildFirstSection() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(padding: EdgeInsets.only(top: 10)),
        new Text(
          '  销售统计',
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: 18,
            color: SAColor.textBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        new Container(
          constraints: new BoxConstraints.expand(height: 90),
          child: new CustomScrollView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            slivers: <Widget>[
              new SliverPadding(
                padding: new EdgeInsets.all(8),
                sliver: new SliverList(
                    delegate: new SliverChildListDelegate(<Widget>[
                  HomeStaticsItem(
                    itemTitle: _itemTitles[0],
                    itemCount: _itemCounts[0],
                    imageName: 'img/deal_down.png',
                    onPress: () {},
                  ),
                  SizedBox(width: 15),
                  HomeStaticsItem(
                    itemTitle: _itemTitles[1],
                    itemCount: _itemCounts[1],
                    imageName: 'img/order_item.png',
                    onPress: () {},
                  ),
                  SizedBox(width: 15),
                  HomeStaticsItem(
                    itemTitle: _itemTitles[2],
                    itemCount: _itemCounts[2],
                    imageName: 'img/dealer.png',
                    onPress: () {},
                  ),
                  SizedBox(width: 15),
                  HomeStaticsItem(
                    itemTitle: _itemTitles[3],
                    itemCount: _itemCounts[3],
                    imageName: 'img/deal_down.png',
                    onPress: () {},
                  ),
                ])),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildSecondSection() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(padding: EdgeInsets.only(top: 10)),
        new Text(
          '  近两日保养',
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: 18,
            color: SAColor.textBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        HomeSenseAppointCell(
            cellCategory:
                HomeAppointCellCategory.HomeAppointCellCategoryMaintain,
            timestamp: '2019-01-10 13:30',
            appointContent: '按10000公里保养',
            appointCarInfo: '途观L OT16ZY | 沪A123456',
            appointInitiator: '王先生 | 183****8899'),
        HomeSenseAppointCell(
            cellCategory:
                HomeAppointCellCategory.HomeAppointCellCategoryService,
            timestamp: '2019-01-10 13:30',
            appointContent: '按10000公里保养',
            appointCarInfo: '途观L OT16ZY | 沪A123456',
            appointInitiator: '王先生 | 183****8899',
            serviceConsultantName: '张明宇')
      ],
    );
  }

  Widget bottomTipWidget() {
    return new Container(
      padding: EdgeInsets.only(top: 0),
      height: 40,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 100,
            height: 0.5,
            color: SAColor.textlightGray,
          ),
          new SizedBox(
            width: 15,
          ),
          new Text(
            '到底了',
            style: new TextStyle(fontSize: 10, color: SAColor.textlightGray),
          ),
          new SizedBox(
            width: 15,
          ),
          new Container(
            width: 100,
            height: 0.5,
            color: SAColor.textlightGray,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SAColor.white,
      body: Stack(
        children: <Widget>[
          new Container(
            color: SAColor.backgroundColor,
            child: new ListView(
              padding: EdgeInsets.only(top: 0),
              controller: scrollController,
              children: <Widget>[
                buildStatusHead(),
                buildFirstSection(),
                buildSecondSection(),
                bottomTipWidget()
              ],
            ),
          ),
          buildNavigationBar(),
        ],
      ),
    );
  }
}
