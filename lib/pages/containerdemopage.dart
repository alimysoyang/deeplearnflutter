import 'package:flutter/material.dart';
import 'dart:math';

class ContainerDemoPage extends StatelessWidget {

  Color get randomRGB {
    var random = Random();
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  Widget _buildContainer1(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      padding: EdgeInsets.all(10.0),
      color: Colors.teal.shade700,
      alignment: Alignment.center,
      child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
      // foregroundDecoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546495703715&di=a08d86529a624c62f3272db454cdd184&imgtype=0&src=http%3A%2F%2Fi-7.vcimg.com%2Ftrim%2F1bbeea84413b84819efe628a22f5a5f9179536%2Ftrim.jpg'),
      //   ),
      // ),
    );
  }

  Widget _buildCenterContainer() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10.0),
        color: Color(0xFF00FF00),
        width: 120.0,
        height: 120.0,
      ),
    );
  }

  Widget _buildCenterContainer2() {
    return Center(
      child: Container(
        alignment: Alignment(0, 0),
        width: 200.0,
        height: 200.0,
        color: Colors.orange,
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        transform: Matrix4.rotationZ(0.2),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        ),
      ),
    );
  }

  List<Widget> _fromColorList(int count) {
    var random = Random();
    List<Widget> retVal = <Widget>[];

    for (int i = 0;i < count;i++) {
      retVal.add(Container(
        width: 100.0 * (random.nextDouble() + 0.3),
        height: 30.0,
        color: randomRGB,
      ));
    }
    return retVal;
  }

  Widget _buildWrap() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: _fromColorList(50),
    );
  }

  Widget _buildSizedBox() {
    return Container(
      alignment: Alignment.center,
      color: Colors.blueAccent,
      width: 300.0,
      height: 300.0,
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Container(
          color: Colors.brown,
        ),
      ),
    );
  }

  Widget _buildFractionallySizedBox() {
    return Container(
      alignment: Alignment.center,
      color: Colors.cyanAccent,
      width: 300.0,
      height: 300.0,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        heightFactor: 0.8,
        child: Container(
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  Widget _buildAspectRatio() {
    return Container(
      alignment: Alignment.center,
      color: Colors.deepPurple,
      width: 320.0,
      height: 640.0,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Container(
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Demo'),
      ),
      body: ListView(
        children: <Widget>[
          _buildContainer1(context),
          _buildCenterContainer(),
          _buildCenterContainer2(),
          Padding(padding: EdgeInsets.only(top: 50.0),),
          _buildWrap(),
          Padding(padding: EdgeInsets.only(top: 50.0),),
          _buildSizedBox(),
          Padding(padding: EdgeInsets.only(top: 50.0),),
          _buildFractionallySizedBox(),
          Padding(padding: EdgeInsets.only(top: 50.0),),
          _buildAspectRatio(),
        ],
      ),
    );
  }
}