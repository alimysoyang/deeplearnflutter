import 'package:flutter/material.dart';

class NestedScrollViewDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                title: Text('Books'),
                pinned: true,
                expandedHeight: 150.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                  SliverPadding(
                    padding: EdgeInsets.all(8.0),
                    sliver: SliverFixedExtentList(
                      itemExtent: 60.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              ListTile(title: Text('item $index'), onTap: () {
                                debugPrint('tap index:$index');
                              },),
                              Divider(height: 1.0, color: Colors.black12),
                            ],
                          );
                        },
                        childCount: 30,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}