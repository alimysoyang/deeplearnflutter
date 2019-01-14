import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomSheetDemoPage extends StatelessWidget {

  final BottomSheet bottomSheetView = BottomSheet(
    builder: (BuildContext context) {
      return Container(
        color: Color(0xFFABF5E0),
        child: Wrap(
          children: <Widget>[
            Center(child: Text('绝域从军计惘然，')),
            Center(child: Text('东南幽恨满词笺。')),
            Center(child: Text('一箫一剑平生意，')),
            Center(child: Text('负尽狂名十五年。')),
          ],
        ),
      );
    },
    onClosing: () {
      debugPrint('Bottom Sheet Closing');
    },
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Demo'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            top: false,
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(24.0),
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    child: Text('Show a BottomSheet'),
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(bottomSheetView.builder);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );  
  }

  Widget _buildiOS() {
    final List<Widget> views = <Widget>[
      CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: Text('Show a BottomSheet'),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet(bottomSheetView.builder);
        },
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('Bottom Sheet Demo'),
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

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAndroid();
  }
}
