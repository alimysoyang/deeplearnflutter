import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deeplearnflutter/modules/demoitem.dart';
import 'package:deeplearnflutter/views/demolistitem.dart';
import 'cupertinobuttonsdemopage.dart';
import 'cupertinoalertdemopage.dart';
import 'cupertinoswitchdemopage.dart';
import 'snackbardemopage.dart';
import 'bottomsheetdemopage.dart';
import 'drawerdemopage.dart';
import 'textdemopage.dart';
import 'imagedemopage.dart';
import 'icondemopage.dart';
import 'listviewdemopage.dart';
import 'stepperdemopage.dart';
import 'sliderdemopage.dart';
import 'textfieldemopage.dart';
import 'textformfieldemo.dart';
import 'package:deeplearnflutter/modules/eventbus.dart';
import 'package:deeplearnflutter/modules/userinfo.dart';

class CupertinoListPage extends StatefulWidget {
  @override
  _CupertinoListPageState createState() => _CupertinoListPageState();
}

class _CupertinoListPageState extends State<CupertinoListPage> {
  final List<DemoItem> demos = <DemoItem>[
    DemoItem(icon: Icons.tab, title: 'Buttons', subtitle: 'Cupertino Buttons Demo'),
    DemoItem(icon: Icons.add_alert, title: 'Alert', subtitle: 'Cupertino Alert Demo'),
    DemoItem(icon: Icons.local_bar, title: 'SnackBar', subtitle: 'Cupertino SnackBar Demo'),
    DemoItem(icon: Icons.border_bottom, title: 'BottomSheet', subtitle: 'Cupertino BottomSheet Demo'),
    DemoItem(icon: Icons.poll, title: 'Drawer', subtitle: 'Cupertino Drawer Demo'),
    DemoItem(icon: Icons.switch_video, title: 'Switch', subtitle: 'Cupertino Switch Button Demo'),
    DemoItem(icon: Icons.timer, title: 'Picker', subtitle: 'Cupertino Picker Demo'),
    DemoItem(icon: Icons.text_fields, title: 'TextField', subtitle: 'Cupertino TextField Demo'),
    DemoItem(icon: Icons.slideshow, title: 'Slider', subtitle: 'Cupertino Slider Demo'),
    DemoItem(icon: Icons.track_changes, title: 'SegmentedControl', subtitle: 'Cupertino SegmentedControl Demo'),
    DemoItem(icon: Icons.refresh, title: 'RefreshControl', subtitle: 'Cupertino RefreshControl Demo'),
    DemoItem(icon: Icons.restore, title: 'ActivityIndicator', subtitle: 'Cupertino ActivityIndicator Demo'),
    DemoItem(icon: Icons.texture, title: 'Text', subtitle: 'Cupertino Text Demo'),
    DemoItem(icon: Icons.image, title: 'Image', subtitle: 'Cupertino Image Demo'),
    DemoItem(icon: Icons.image_aspect_ratio, title: 'Icon', subtitle: 'Cupertino Icon Demo'),
    DemoItem(icon: Icons.list, title: 'ListView', subtitle: 'Cupertino ListView Demo'),
    DemoItem(icon: Icons.last_page, title: 'Stepper', subtitle: 'Cupertino Stepper Demo'),
    DemoItem(icon: Icons.text_fields, title: 'TextFormField', subtitle: 'Cupertino TextFormField Demo'),
  ];

  @override
  void initState() {
    super.initState();
    bus.on('login', (arg) {
      if (arg[0] is UserInfo)
      {
        var tmp = arg[0] as UserInfo;
        debugPrint('登录事件监听:${tmp.userName}');
      } else {
        debugPrint('登录事件监听未知对象:$arg');
      }
    });
  }

  @override
  void dispose() {
    bus.off('login');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontFamily: '.SF UI Text', inherit: false, fontSize: 17.0, color: CupertinoColors.black),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回' ,
          middle: Text('Cupertino'),
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
                      final DemoItem item = demos[index];
                      return CupertinoDemoListItem(item: item, onTap: () {
                        debugPrint('Cupertino List Page Clicked Cell index:$index');
                        if (index == 0) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => CupertinoButtonsDemoPage()));
                        } else if (index == 1) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => CupertinoAlertDemoPage()));
                        } else if (index == 2) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SnackBarDemoPage()));
                        } else if (index == 3) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => BottomSheetDemoPage()));
                        } else if (index == 4) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => DrawerDemoPage()));
                        } else if (index == 5) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => CupertinoSwitchDemoPage()));
                        } else if (index == 7) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => TextFieldDemoPage()));
                        } else if (index == 8) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SliderDemoPage()));
                        } else if (index == 12) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => TextDemoPage()));
                        } else if (index == 13) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ImageDemoPage()));
                        } else if (index == 14) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => IconDemoPage()));
                        } else if (index == 15) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ListViewDemoPage()));
                        } else if (index == 16) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => StepperDemoPage()));
                        } else if (index == 17) {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => TextFormFieldDemoPage()));
                        }
                      });
                    },
                    childCount: demos.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}