import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ExpansionPanelDemoPage extends StatefulWidget {

  @override
  _ExpansionPanelDemoPageState createState() => _ExpansionPanelDemoPageState();
}

class _ExpansionPanelDemoPageState extends State<ExpansionPanelDemoPage> {

  bool _isExpanded = true;

  Widget _buildPanel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ExpansionPanelList(
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(6.0),
                  child: Text('Plan A', style: TextStyle(fontSize: 24.0)),
                );
              },
              body: Container(
                padding: EdgeInsets.all(6.0),
                width: double.infinity,
                child: Text('Content for Panel A'),
              ),
              isExpanded: _isExpanded,
            ),
          ],
          expansionCallback: (int panelIndex, bool isExpanded) {
            setState(() {
              _isExpanded = !isExpanded;
            });
          },
        ),
      ],
    );
  }

  Widget _buildiOS() {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('ExpansionPanel Demo'),
        ),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel Demo'),
      ),
      body: _buildPanel(),
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