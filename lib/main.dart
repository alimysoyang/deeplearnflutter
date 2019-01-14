import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'dart:core';
import 'dart:async';
import 'mainmenupage.dart';
import 'pages/cupertinolistpage.dart';
import 'pages/materialistpage.dart';
import 'pages/animationlistpage.dart';
import 'pages/filesystemdemopage.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // DateTime _lastPressedAt;
  int _lastClickTime;

  Future<bool> _doubleExit() {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return Future.value(true);
    } else {
      _lastClickTime = DateTime.now().millisecondsSinceEpoch;
      Future.delayed(Duration(microseconds: 1500), () {
        _lastClickTime = 0;
      });
      return Future.value(false);
    }
  } 

  Future<bool> _exitDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ) ?? false;
  }

  Widget _buildAnroid() {
    return WillPopScope(
      onWillPop: _exitDialog,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MenuMenuListViewPage(),
          '/pages/cupertinolistpage': (context) => CupertinoListPage(),
          '/pages/materiallistpage': (context) => MaterialListPage(),
          '/pages/animationlistpage': (context) => AnimationListPage(),
          '/pages/filesystemdemopage': (context) => FileSystemDemoPage(),
        },
      ),
    );

    // return WillPopScope(
    //   onWillPop: () async {
    //     if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
    //       _lastPressedAt = DateTime.now();
    //       return false;
    //     }
    //     return true;
    //   },
    //   child: MaterialApp(
    //     initialRoute: '/',
    //     routes: {
    //       '/': (context) => MenuMenuListViewPage(),
    //       '/pages/cupertinolistpage': (context) => CupertinoListPage(),
    //       '/pages/materiallistpage': (context) => MaterialListPage(),
    //       '/pages/animationlistpage': (context) => AnimationListPage(),
    //     },
    //   ),
    // );
  }

  Widget _buildiOS() {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuMenuListViewPage(),
        '/pages/cupertinolistpage': (context) => CupertinoListPage(),
        '/pages/materiallistpage': (context) => MaterialListPage(),
        '/pages/animationlistpage': (context) => AnimationListPage(),
        '/pages/filesystemdemopage': (context) => FileSystemDemoPage(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //获取屏幕尺寸px
    debugPrint(window.physicalSize.toString());
    //获取设备像素比
    debugPrint(window.devicePixelRatio.toString());

    // IOFile f = IOFile();
//    f.showDir();
//    f.startShowAndroid();
    //  f.createDir();
    // f.appendWriteFile().then((void v) {
    //   debugPrint('写入完成');
    // });

    // f.readAsLinesFile();
    // f.readAsBytesFile();

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAnroid();
  }
}
