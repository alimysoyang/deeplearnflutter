import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDemoPage extends StatefulWidget {
  @override
  _IconDemoPageState createState() => _IconDemoPageState();
}

class _IconDemoPageState extends State<IconDemoPage> with SingleTickerProviderStateMixin {

  TargetPlatform _platform;

  AnimationController _controller;

  List<Widget> wicons;

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Demo'),
        actions: <Widget>[
          IconButton(
            icon: AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: _controller.view),
            onPressed: () {
              _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: wicons,
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Icon Demo'),
        trailing: CupertinoButton(
          child: AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: _controller.view),
          onPressed: () {
            _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
          },
        ),
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
                    return wicons[index];
                  },
                  childCount: wicons.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(microseconds: 3000), value: 1.0, vsync: this);

    wicons = <Widget>[
      Padding(padding: EdgeInsets.only(top: 20)),
      Icon(Icons.android),
      Padding(padding: EdgeInsets.only(top: 20)),
      Icon(Icons.android, size: 160.0),
      Padding(padding: EdgeInsets.only(top: 20)),
      Icon(Icons.android, size: 80.0, color: Colors.orange),
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _platform = Theme.of(context).platform;
    if (_platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAndroid();
  }
}