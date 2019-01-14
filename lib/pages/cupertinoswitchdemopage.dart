import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSwitchDemoPage extends StatefulWidget {
  @override
  _CupertinoSwitchDemoPageState createState() => _CupertinoSwitchDemoPageState();
}

class _CupertinoSwitchDemoPageState extends State<CupertinoSwitchDemoPage> {

  Widget _buildNormalSwitch() {
    return Semantics(
      container: true,
      child: Column(
        children: <Widget>[
          CupertinoSwitch(
            value: true,
            onChanged: (bool value) {
              setState(() {
                
              });
            },
          ),
          Text('Active'),
        ],
      ),
    );
  }

  Widget _buildDisableTrueSwitch() {
    return Semantics(
      container: true,
      child: Column(
        children: <Widget>[
          CupertinoSwitch(
            value: true,
            onChanged: null,
          ),
          Text('Disable'),
        ],
      ),
    );
  }

  Widget _buildDisableFalseSwitch() {
    return Semantics(
      container: true,
      child: Column(
        children: <Widget>[
          CupertinoSwitch(
            value: false,
            onChanged: null,
          ),
          Text('Disable'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _views = <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildNormalSwitch(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildDisableTrueSwitch(),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildDisableFalseSwitch(),
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Switch Demo'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverSafeArea(
              top: true,
              bottom: true,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _views[index];
                  },
                  childCount: _views.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}