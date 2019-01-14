import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlphaAnimationDemoPage extends StatefulWidget {
  @override
  _AlphaAnimationDemoPageState createState() => _AlphaAnimationDemoPageState();
}

class _AlphaAnimationDemoPageState extends State<AlphaAnimationDemoPage> with TickerProviderStateMixin {
  Animation<double> alpha;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    alpha = Tween<double>(begin: 0.0, end: 1.0).animate(controller)..addListener(() {
      setState(() { });
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alpha Animation'),
      ),
      body: Opacity(
        opacity: alpha.value,
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Alpha Animation'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: Opacity(
          opacity: alpha.value,
          child: Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              color: Colors.orange,
            ),
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