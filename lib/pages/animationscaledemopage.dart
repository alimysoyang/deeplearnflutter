import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaleAnimationDemoPage extends StatefulWidget {
  @override
  _ScaleAnimationDemoPageState createState() => _ScaleAnimationDemoPageState();
}

class _ScaleAnimationDemoPageState extends State<ScaleAnimationDemoPage> with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<int> alpha;
  Animation<Color> colorAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    // alpha = IntTween(begin: 0, end: 255).animate(controller)..addListener(() {
    //   setState(() { });
    // });
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)..addListener((){
      setState(() { });
    });
    // Animation curve = CurvedAnimation(parent:controller, curve: Curves.easeOut);
    // colorAnimation = ColorTween(begin: Colors.black, end: Colors.orange).animate(curve)..addListener(() {
    //   setState(() { });
    // });
    // colorAnimation = ColorTween(begin: Colors.black, end: Colors.orange).animate(controller)..addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

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
        title: Text('Scale Animation'),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.orange,//colorAnimation.value == null ? Colors.transparent : colorAnimation.value,//Color.fromARGB(alpha.value, 255, 0, 0),
        ),
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Scale Animation'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: Center(
          child: Container(
            width: animation.value,
            height: animation.value,
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