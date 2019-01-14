import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoButtonsDemoPage extends StatefulWidget {
  @override
  _CupertinoButtonsDemoPageState createState() => _CupertinoButtonsDemoPageState();
}

class _CupertinoButtonsDemoPageState extends State<CupertinoButtonsDemoPage> {

  Widget _buildNormalButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Cupertino Button'),
      onPressed: () {
        _showAlertDialog(context, 'information', 'Cupertino Button');
      },
    );
  }

  Widget _buildDisableButton() {
    return CupertinoButton(
      child: Text('Disabled'),
      onPressed: null,
    );
  }

  Widget _buildNormalColorButton() {
    return CupertinoButton(
      child: Text('With Background'),
      color: Colors.amber,//CupertinoColors.activeOrange,
      onPressed: () {

      },
    );
  }

  Widget _buildDisableColorButton() {
    return CupertinoButton(
      child: Text('Disabled'),
      color: CupertinoColors.activeBlue,
      onPressed: null,
    );
  }

  Widget _buildIconButton() {
    return CupertinoButton.filled(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(CupertinoIcons.search),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          Text('Search'),
        ],
      ),
      onPressed: () {

      },
    );
  }

  Widget _buildCustomButton() {
    return CupertinoButton(
      child: Text('Custom Button'),
      color: Color(0xFFFA9894),
      minSize: 36.0,
      pressedOpacity: 0.6,
      borderRadius: BorderRadius.circular(30.0),
      onPressed: () {

      },
    );
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context, '确定');
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, '取消');
              },
            ),
          ],
        );
      },
    ).then<void>((String value) {
      if (value != null) {
        debugPrint('You selected $value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildNormalButton(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildDisableButton(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildNormalColorButton(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildDisableColorButton(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildIconButton(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildCustomButton(),
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Buttons'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverSafeArea(
              top: true,
              bottom: true,
              minimum: EdgeInsets.only(left: 10.0, right: 10.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return buttons[index];
                  },
                  childCount: buttons.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }
}
