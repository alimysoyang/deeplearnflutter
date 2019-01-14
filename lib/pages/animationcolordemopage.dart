import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ColorAnimationDemoPage extends StatefulWidget {
  @override
  _ColorAnimationDemoPageState createState() => _ColorAnimationDemoPageState();
}

class _ColorAnimationDemoPageState extends State<ColorAnimationDemoPage> with TickerProviderStateMixin {
  Animation<Color> colorAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);

    Animation curve = CurvedAnimation(parent:controller, curve: Curves.easeOut);
    colorAnimation = ColorTween(begin: Colors.black, end: Colors.orange).animate(curve)..addListener(() {
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
        title: Text('Color Animation'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: colorAnimation.value,
        ),
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Color Animation'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            color: colorAnimation.value,
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