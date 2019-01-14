import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationContainerDemoPage extends StatefulWidget {
  @override
  _AnimationContainerDemoPageState createState() => _AnimationContainerDemoPageState();
}

class _AnimationContainerDemoPageState extends State<AnimationContainerDemoPage> {

  Duration animationDuration = Duration(seconds: 2);
  Duration resetDuration = Duration(seconds: 1);
  double _height = 250.0;
  double _width = 300.0;
  double _border = 2.0;
  ColorSwatch _color = Colors.redAccent;
  BoxShape _shape = BoxShape.rectangle;
  Duration duration;

  Widget _buildRectangle() {
    return AnimatedContainer(
      duration: duration == null ? animationDuration : duration,
      height: _height,
      width: _width,
      decoration: BoxDecoration(
        color: _color,
        shape: _shape,
        border: Border.all(width: _border),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildRectangle(),
          RaisedButton(
            child: Text('reset'),
            onPressed: () {
              setState(() {
                duration = resetDuration;
                _height = 250.0;
                _width = 300.0;
                _border = 2.0;
                _color = Colors.redAccent;
                _shape = BoxShape.rectangle;
              });
            },
          ),
          RaisedButton(
            child: Text('Height'),
            onPressed: () {
               setState(() {
                 duration = animationDuration;
                 _height = 100.0;
               });
            },
          ),
          RaisedButton(
            child: Text('Width'),
            onPressed: () {
              setState(() {
                duration = animationDuration;
                _width = 200.0;
              });
            },
          ),
          RaisedButton(
            child: Text('Border'),
            onPressed: () {
              setState(() {
                duration = animationDuration;
                _border = 10.0;
              });
            },
          ),
          RaisedButton(
            child: Text('Color'),
            onPressed: () {
              setState(() {
                duration = animationDuration;
                _color = Colors.orange;
              });
            },
          ),
          RaisedButton(
            child: Text('Circle'),
            onPressed: () {
              setState(() {
                duration = animationDuration;
                _shape = BoxShape.circle;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildiOS() {
    final Widget views = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildRectangle(),
        CupertinoButton(
          child: Text('reset'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
                duration = resetDuration;
                _height = 250.0;
                _width = 300.0;
                _border = 2.0;
                _color = Colors.redAccent;
                _shape = BoxShape.rectangle;
              });
          },
        ),
        CupertinoButton(
          child: Text('Height'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
              duration = animationDuration;
              _height = 100.0;
            });
          },
        ),
        CupertinoButton(
          child: Text('Width'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
              duration = animationDuration;
              _width = 200.0;
            });
          },
        ),
        CupertinoButton(
          child: Text('Border'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
              duration = animationDuration;
              _border = 10.0;
            });
          },
        ),
        CupertinoButton(
          child: Text('Color'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
              duration = animationDuration;
              _color = Colors.orange;
            });
          },
        ),
        CupertinoButton(
          child: Text('Circle'),
          color: CupertinoColors.activeBlue,
          onPressed: () {
            setState(() {
              duration = animationDuration;
              _shape = BoxShape.circle;
            });
          },
        ),
      ],
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Animated Container'),
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
                    return views;
                  },
                  childCount: 1,
                ),
              ),
            )
          ],
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