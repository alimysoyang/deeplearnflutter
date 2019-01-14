import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const String _text1 = 'Snackbars provide lightweight feedback about an operation by showing a brief message at the bottom of the screen. Snackbars can contain an action';

const String _text2 = 'Snackbars should contain a single line of text directly related to the operation performed. They cannot contain icons.';

const String _text3 = 'By default snackbars automatically disappear after a few seconds.';

class SnackBarDemoPage extends StatefulWidget {
  @override
  _SnackBarDemoPageState createState() => _SnackBarDemoPageState();
}

class _SnackBarDemoPageState extends State<SnackBarDemoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildAndroidBody(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: ListView(
        padding: EdgeInsets.all(24.0),
        children: <Widget>[
          Text(_text1),
          Text(_text2),
          Center(
            child: RaisedButton(
              child: Text('Show a snackbar'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('This is snackbar'),
                  action: SnackBarAction(
                    label: 'ACTION',
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('You pressed snackbar action'),
                      ));
                    },
                  ),
                ));
              },
            ),
          ),
          Text(_text3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      final List<Widget> views = <Widget>[
        Text(_text1),
        Text(_text2),
        CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Show a snackbar'),
          onPressed: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('This is snackbar'),
              action: SnackBarAction(
                label: 'ACTION',
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('You pressed snackbar action'),
                  ));
                },
              ),
            ));
          },
        ),
        Text(_text3),
      ];

      return Scaffold(
        key: _scaffoldKey,
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            previousPageTitle: '返回',
            middle: Text('SnackBar Demo'),
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
                        return views[index];
                      },
                      childCount: views.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar Demo'),
      ),
      body: Builder(
        builder: _buildAndroidBody,
      ),
    );
  }
}