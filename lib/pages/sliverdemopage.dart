import 'package:flutter/material.dart';

class SliverDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              centerTitle: true,
              background: Image(fit: BoxFit.cover, image: AssetImage('images/j.jpeg')),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), color: Colors.white, tooltip: 'Search', onPressed: () {

              }),
            ],
          ),

          SliverFixedExtentList(
            itemExtent: 200.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey,
                  child: Text('SliverFixedExtentList', textAlign: TextAlign.center ),
                );
              },
              childCount: 1,
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 18,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //均匀划分网格范围,范围最多为maxCrossAxisExtent的值
              //example:如果网格是垂直的，网格为500.0像素宽，
              //并且[maxCrossAxisExtent]为150.0（将要划分的网格范围最多不超过150）
              //此委托将创建一个网格，其中4列宽为125.0像素。
              maxCrossAxisExtent: 180.0,
              mainAxisSpacing: 1.0,//主轴,横向,item之间的间距
              crossAxisSpacing: 4.0,//纵轴,item之间的间距
              childAspectRatio: 1.0,//宽/高的比例
            ),
          ),
        ],
      ),
    );
  }
}