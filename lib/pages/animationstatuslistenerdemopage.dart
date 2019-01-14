import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationView extends AnimatedWidget {
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimationView({Key key, Animation<double> animation}):super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        width: _sizeTween.evaluate(animation),
        height: _sizeTween.evaluate(animation),
        color: Colors.orange,
      ),
    );
  }
}

class AnimationStatusListenerDemoPage extends StatefulWidget {
  @override
  _AnimationStatusListenerDemoPageState createState() => _AnimationStatusListenerDemoPageState();
}

class _AnimationStatusListenerDemoPageState extends State<AnimationStatusListenerDemoPage> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
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
        title: Text('Animation Status Listener'),
      ),
      body: AnimationView(animation: animation),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Animation Status Listener'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: AnimationView(animation: animation),
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