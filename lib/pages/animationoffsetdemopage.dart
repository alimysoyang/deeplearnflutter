import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OffSetAnimationDemoPage extends StatefulWidget {
  @override
  _OffSetAnimationDemoPageState createState() => _OffSetAnimationDemoPageState();
}

class _OffSetAnimationDemoPageState extends State<OffSetAnimationDemoPage> with TickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<Offset>(begin: Offset(-1.0, -1.0), end: Offset(1.0, 1.0)).animate(controller)..addListener((){
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
        title: Text('Offset Animation'),
      ),
      body: Container(
        alignment: Alignment(animation.value.dx, animation.value.dy),
        width: 300.0,
        height: 300.0,
        color: Colors.red,
        child: Container(
          width: 50.0,
          height: 50.0,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Offset Animation'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: Container(
          alignment: Alignment(animation.value.dx, animation.value.dy),
          width: 300.0,
          height: 300.0,
          color: Colors.red,
          child: Container(
            height: 50.0,
            width: 50.0,
            color: Colors.orange,
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