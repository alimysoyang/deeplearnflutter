import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final IconData trailing;
  final VoidCallback onTap;

  ListItem({ this.title, this.subtitle, this.leading, this.trailing, this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
        height: 66.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 9.0, right: 9.0), child: Icon(leading, size: 36.0)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(title, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: CupertinoColors.black)),
                  ), 
                  Text(subtitle, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.0, color: CupertinoColors.inactiveGray)),
                ],
              ),
            ),
          
            Padding(padding: EdgeInsets.only(right: 5.0), child: Icon(trailing, size: 24.0)),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class MenuMenuListViewPage extends StatelessWidget {
  final List<Map<String, String>> menus = [
    {'title':'Cupertino', 'subtitle':'Cupertino iOS Style Demos'},
    {'title':'Material', 'subtitle':'Material Android Style Demos'},
    {'title':'Animation', 'subtitle':'Animation Demos'},
    {'title':'WebSocket', 'subtitle':'WebSocket Demo'},
    {'title':'Http', 'subtitle':'Http Demo'},
    {'title':'I/O', 'subtitle':'File System Demo'},

  ];

  void _routePage(BuildContext context, int index) {
    debugPrint('Clicked cell index:$index');
    if (index == 0) {
      Navigator.pushNamed(context, '/pages/cupertinolistpage');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/pages/materiallistpage');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/pages/animationlistpage');
    } else if (index == 5) {
      Navigator.pushNamed(context, '/pages/filesystemdemopage');
    }
  }

  Widget _item(BuildContext context, int index) {
    final String title = menus[index]['title'];
    final String subtitle = menus[index]['subtitle'];
    return ListTile(
      leading: Icon(Icons.menu),
      title: Text(title, style: TextStyle(fontSize: 20.0)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 13.0, color: Colors.orangeAccent)),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        debugPrint('Clicked Cell Index:$index');

        _routePage(context, index);
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 88.0,
          color: Colors.white,
          child: _item(context, index),
        );
      },
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final String title = menus[index]['title'];
          final String subtitle = menus[index]['subtitle'];
          return ListItem(title: title, subtitle: subtitle, leading: CupertinoIcons.collections, trailing: CupertinoIcons.right_chevron, onTap: () {
            _routePage(context, index);
          });
        },
        childCount: menus.length,
      ),
    );
  }

  Widget _viewsStyle(BuildContext context) {
    //获取屏幕dp单位
    debugPrint(MediaQuery.of(context).size.toString());

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('深入学习Flutter(iOS)'),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                top: true,
                sliver: _buildSliverList(),
              ),
            ],
          ),
        ),
      );
    } 

    return Scaffold(
      appBar: AppBar(
        title: Text('深入学习Flutter(Android)'),
      ),
      body: Center(
        child: _buildList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _viewsStyle(context);
  } 
}
