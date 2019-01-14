import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  _ListViewDemoPageState createState() => _ListViewDemoPageState();
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {
  ScrollController _controller = ScrollController();

  String _progress = '0%';

  bool _isHorizontal = false;

  Widget _buildHListView() {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double p = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          setState(() { _progress = '${(p * 100).toInt()}%'; });
        },
        child: ListView.builder(
          itemCount: 100,
          padding: EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemExtent: 60.0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Center(child: Text('toly $index', style: TextStyle(fontSize: 14.0))),
            );
          },
        ),
      ),
    );
  }

  Widget _buildVListView() {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double p = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          setState(() { _progress = '${(p * 100).toInt()}%'; });
        },
        child: ListView.builder(
          itemCount: 100,
          padding: EdgeInsets.all(8.0),
          itemExtent: 60.0,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Center(child: Text('toly $index', style: TextStyle(fontSize: 14.0))),
            );
          },
        ),
      ),
    );
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('List View Demo'),
        trailing: CupertinoButton(
          child: Text(_isHorizontal ? '水平' : '垂直'),
          onPressed: () {
            setState(() {
              _isHorizontal = !_isHorizontal;
            });
          },
        ),
      ),
      child: SafeArea(
        top: true,
        bottom: true,
        child: _isHorizontal ? _buildHListView() : _buildVListView(),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Demo'),
        actions: <Widget>[
          CircleAvatar(
            radius: 20.0,
            child: Text(_progress),
            backgroundColor: Colors.black54,
          ),
          IconButton(
            icon:Icon(Icons.refresh),
            onPressed: () {
              _controller.animateTo(0.0, duration: Duration(microseconds: 200), curve: Curves.ease);
              setState(() { _progress = '0%'; });
            },
          ),

          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _isHorizontal = !_isHorizontal;
              });
            },
          ),
        ],
      ),
      body: _isHorizontal ? _buildHListView() : _buildVListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint(_controller.offset.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAndroid();
  }
}