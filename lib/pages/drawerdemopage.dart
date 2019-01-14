import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerDemoPage extends StatefulWidget {
  @override
  _DrawerDemoPageState createState() => _DrawerDemoPageState();
}

class _DrawerDemoPageState extends State<DrawerDemoPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildSimpleDrawer() {
    return Drawer(
      elevation: 5,
      child: Container(
        alignment: Alignment.center,
        color: Color(0xFF99C6F9),
        child: Text('Alimyso', style: TextStyle(fontSize: 30.0)),
      ),
    );
  }

  Widget _buildSimpleListDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add'),
            onTap: () {
              debugPrint('Add');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text('Add Photo'),
            onTap: () {
              debugPrint('Add Photo');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('Add Alarm'),
            onTap: () {
              debugPrint('Add Alarm');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alert),
            title: Text('Add Alert'),
            onTap: () {
              debugPrint('Add Alert');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Add Box'),
            onTap: () {
              debugPrint('Add Box');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_call),
            title: Text('Add Call'),
            onTap: () {
              debugPrint('Add Call');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Add Circle'),
            onTap: () {
              debugPrint('Add Circle');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_comment),
            title: Text('Add Comment'),
            onTap: () {
              debugPrint('Add Comment');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_location),
            title: Text('Add Location'),
            onTap: () {
              debugPrint('Add Location');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text('Add Shopping cart'),
            onTap: () {
              debugPrint('Add Shopping cart');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text('Alimyso'),
            accountEmail: Text('alimyso@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('T'),
            ),
            onDetailsPressed: () {

            },
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {

                },
                child: Semantics(
                  label: 'Switch to Account B',
                  child: CircleAvatar(
                    child: Text('AB'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Semantics(
                  label: 'Switch to Account C',
                  child: CircleAvatar(
                    child: Text('AC'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      drawer: _buildSimpleDrawer(),
      endDrawer: _buildSimpleListDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text('Show Drawer'),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          RaisedButton(
            child: Text('Show EndDrawer'),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildiOS() {
    final List<Widget> views = <Widget>[
      CupertinoButton(
        child: Text('Show Drawer'),
        color: CupertinoColors.activeBlue,
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),

      CupertinoButton(
        child: Text('Show EndDrawer'),
        color: CupertinoColors.activeOrange,
        onPressed: () {
          _scaffoldKey.currentState.openEndDrawer();
        },
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawerHeader(),
      endDrawer: _buildSimpleListDrawer(),
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('Drawer Demo'),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFEFEFF4),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                top: true,
                bottom: true,
                minimum: EdgeInsets.only(left: 10.0, right: 10.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return views[index];
                    },
                    childCount: views.length,
                  ),
                ),
              ),
            ],
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