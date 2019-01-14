import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:deeplearnflutter/modules/demoitem.dart';

class DemoListItem extends StatelessWidget {
  final DemoItem item;
  final VoidCallback onTap;

  DemoListItem({this.item, this.onTap});

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 6.0),
        height: 88.0,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 9.0, right: 8.0), child: Icon(item.icon)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(item.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: CupertinoColors.black)),
                  ),
                  Text(item.subtitle, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: CupertinoColors.activeBlue)),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}