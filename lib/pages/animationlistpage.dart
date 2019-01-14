import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:deeplearnflutter/modules/demoitem.dart';
import 'package:deeplearnflutter/views/demolistitem.dart';
import 'animationscaledemopage.dart';
import 'animationalphademopage.dart';
import 'animationcolordemopage.dart';
import 'animationoffsetdemopage.dart';
import 'animationstatuslistenerdemopage.dart';
import 'animationcontainerdemopage.dart';

class AnimationListPage extends StatelessWidget {
  final List<DemoItem> demos = <DemoItem>[
    DemoItem(icon: Icons.assignment_ind, title: 'Scale', subtitle: 'Scale Demo'),
    DemoItem(icon: Icons.assignment_return, title: 'Alpha', subtitle: 'Alpha Demo'),
    DemoItem(icon: Icons.assignment_turned_in, title: 'Color', subtitle: 'Color Demo'),
    DemoItem(icon: Icons.assistant_photo, title: 'Offset', subtitle: 'Offset Demo'),
    DemoItem(icon: Icons.assignment_late, title: 'Status Listener', subtitle: 'Status Listener Demo'),
    DemoItem(icon: Icons.format_align_center, title: 'Animated Container', subtitle: 'Animated Container Demo'),
  ];

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: demos.length,
          separatorBuilder: (BuildContext context, int index) => Divider(color: Theme.of(context).dividerColor),
          itemBuilder: (BuildContext context, int index) {
            final DemoItem item = demos[index];
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title, style: TextStyle(fontSize: 20.0)),
              subtitle: Text(item.subtitle, style: TextStyle(fontSize: 13.0)),
              onTap: () {
                if (index == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScaleAnimationDemoPage()));
                } else if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlphaAnimationDemoPage()));
                } else if (index == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ColorAnimationDemoPage()));
                } else if (index == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OffSetAnimationDemoPage())); 
                } else if (index == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationStatusListenerDemoPage()));
                } else if (index == 5) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationContainerDemoPage()));
                }
              },
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
        middle: Text('Animations'),
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
                    return DemoListItem(item: item, onTap: () {
                      if (index == 0) {
                        Navigator.push(context, PageRouteBuilder(
                          transitionDuration: Duration(microseconds: 500),
                          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleAnimationDemoPage(),
                            );
                          }));
                        // Navigator.push(context, CupertinoPageRoute(builder: (context) => ScaleAnimationDemoPage()));
                      } else if (index == 1) {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => AlphaAnimationDemoPage()));
                      } else if (index == 2) {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ColorAnimationDemoPage()));
                      } else if (index == 3) {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => OffSetAnimationDemoPage())); 
                      } else if (index == 4) {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => AnimationStatusListenerDemoPage()));
                      } else if (index == 5) {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => AnimationContainerDemoPage()));
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
