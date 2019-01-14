import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class SingleChildScrollViewDemoPage extends StatefulWidget {
  @override
  _SingleChildScrollViewDemoPageState createState() => _SingleChildScrollViewDemoPageState();
}

class _SingleChildScrollViewDemoPageState extends State<SingleChildScrollViewDemoPage> {

  bool _isVertical = true;

  Color get randomRGB {
    var random = Random();
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  } 

  List<Widget> _fromVBoxes(int count) {
    List<Widget> retVal = <Widget>[];
    var random = Random();

    for (int i = 0;i < count;i++) {
      retVal.add(
        Container(
          width: 100.0 * random.nextDouble() + 0.3,
          height: 30.0,
          color: randomRGB,
        )
      );
    }
    return retVal;
  }

  List<Widget> _fromHBoxes(int count) {
    List<Widget> retVal = <Widget>[];
    var random = Random();

    for (int i = 0;i < count;i++) {
      retVal.add(
        Container(
          width: 30.0,
          height: 100.0 * random.nextDouble() + 0.3,
          color: randomRGB,
        )
      );
    }
    return retVal;
  }

  Widget _scrollVView() {
    return SingleChildScrollView(
      child: Column(
        children: _fromVBoxes(100),
      ),
    );
  }

  Widget _scrollHView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _fromHBoxes(100),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.border_horizontal),
            onPressed: () {
              setState(() {
                _isVertical = !_isVertical;
              });
            },
          ),
        ],
      ),
      body: _isVertical ? _scrollVView() : _scrollHView(),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('SingleChildScrollView Demo'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: _isVertical ? _scrollVView() : _scrollHView(),
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