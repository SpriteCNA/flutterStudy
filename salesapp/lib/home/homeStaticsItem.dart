import 'package:flutter/material.dart';
import 'package:salesapp/main/public.dart';

class HomeStaticsItem extends StatelessWidget {
  @required
  final VoidCallback onPress;
  @required
  final String itemTitle;
  @required
  final String itemCount;
  @required
  final String imageName;

  HomeStaticsItem(
      {this.itemCount, this.itemTitle, this.onPress, this.imageName});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: this.onPress,
        child: new Container(
            height: 90,
            width: Screen.width * 0.35,
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(width: 0.2, color: Colors.grey),
                  borderRadius: new BorderRadius.all(new Radius.circular(6))),
              padding: EdgeInsets.only(left: 10, right: 5),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        this.itemTitle,
                        style: new TextStyle(
                            fontSize: 14, color: SAColor.textTitleColor),
                      ),
                      new Text(
                        this.itemCount,
                        style: new TextStyle(
                            fontSize: 24,
                            color: SAColor.textTitleColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 37),
                      new Image.asset(this.imageName, width: 25, height: 25)
                    ],
                  )
                ],
              ),
            )));
  }
}
