import 'package:flutter/material.dart';

class MaterialRowDemoPage extends StatelessWidget {

  Widget _buildTextsRow() {
    return Row(
      children: <Widget>[
        Text('绝域从军计惘然，', style: TextStyle(fontSize: 12.0)),
        Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)),
        Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)),
        Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildExpandTextsRow() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('绝域从军计惘然，')),
        Expanded(child: Text('东南幽恨满词笺。')),
        Expanded(child: Text('一箫一剑平生意，')),
        Expanded(child: Text('负尽狂名十五年。')),
      ],
    );
  }

  Widget _buildRowItem() {
    return Container(
      height: 44.0,
      color: Colors.orangeAccent,
      child: Row(
        children: <Widget>[
          Icon(Icons.camera, size: 24.0),
          Padding(padding: EdgeInsets.only(right: 6.0)),
          Expanded(child: Text('系统设置')),
          Icon(Icons.arrow_forward, size: 24.0),
        ],
      ),
    );
  }

  Widget _buildRowItemAgain() {
    return Container(
      height: 44.0,
      color: Colors.orangeAccent,
      child: Row(
        children: <Widget>[
          Icon(Icons.assistant_photo, size: 24.0),
          Padding(padding: EdgeInsets.only(right: 6.0)),
          Expanded(child: Text('用户信息', style: TextStyle(fontSize: 20.0))),
          Text('Alimyso'),
        ],
      ),
    );
  }

  Widget _buildFlexItem() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Icon(Icons.attach_money, size: 24.0),
        Padding(padding: EdgeInsets.only(right: 6.0)),
        Expanded(child: Text('退回押金')),
        Icon(Icons.battery_alert, size: 24.0),
      ],
    );
  }

  Widget _buildFlexWithContainerItem(MainAxisAlignment alignment) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: alignment,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 80.0,
          color: Colors.pink,
        ),
        Container(
          width: 20.0,
          height: 100.0,
          color: Colors.purpleAccent,
        ),
        Container(
          width: 120.0,
          height: 60.0,
          color: Colors.amberAccent,
          child: Text(alignment.toString()),
        ),
      ],
    );
  }

  Widget _buildFlexWithContainerItem1(CrossAxisAlignment cross) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: cross,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 80.0,
          color: Colors.pink,
        ),
        Container(
          width: 20.0,
          height: 100.0,
          color: Colors.purpleAccent,
        ),
        Container(
          width: 120.0,
          height: 60.0,
          color: Colors.amberAccent,
          child: Text(cross.toString()),
        ),
      ],
    );
  }
  
  Widget _buildExpandFlexItem() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 80.0,
          color: Colors.pink,
        ),
        Expanded(
          child: Container(height:100.0, color: Colors.purpleAccent, child: Text('Expanded')),
        ),
        Container(
          width: 120.0,
          height: 60.0,
          color: Colors.amberAccent,
        ),
      ],
    );
  }

  Widget _buildExpandFlexItem1() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 80.0,
          color: Colors.pink,
        ),
        Container(
          width: 20.0,
          height:100.0, 
          color: Colors.purpleAccent
        ),
        Expanded(
          child: Container(
            height: 60.0,
            color: Colors.amberAccent,
            child: Text('Expanded'),
          ),
        )
      ],
    );
  }

  Widget _buildExpandFlexItem2() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 80.0,
          color: Colors.pink,
        ),
        Expanded(
          child: Container(
            height:100.0, 
            color: Colors.purpleAccent,
            child: Text('Expanded'),
          ),
        ),
        Expanded(
          child: Container(
            height: 60.0,
            color: Colors.amberAccent,
            child: Text('Expanded'),
          ),
        )
      ],
    );
  }

  Widget _buildExpandFlexItem3() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child:Container(
            height: 80.0,
            color: Colors.pink,
            child: Text('Expanded'),
          ),
        ),

        Expanded(
          child: Container(
            height:100.0, 
            color: Colors.purpleAccent,
            child: Text('Expanded'),
          ),
        ),

        Expanded(
          child: Container(
            height: 60.0,
            color: Colors.amberAccent,
            child: Text('Expanded'),
          ),
        )
      ],
    );
  }
  
  Widget _buildExpandFlexItem4() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child:Container(
            height: 80.0,
            color: Colors.pink,
            child: Text('Expanded=1'),
          ),
        ),

        Expanded(
          flex: 2,
          child: Container(
            height:100.0, 
            color: Colors.purpleAccent,
            child: Text('Expanded=2'),
          ),
        ),

        Expanded(
          flex: 3,
          child: Container(
            height: 60.0,
            color: Colors.amberAccent,
            child: Text('Expanded=3'),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout with Row Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        children: <Widget>[
          _buildTextsRow(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandTextsRow(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildRowItem(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildRowItemAgain(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexItem(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.start),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.end),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.center),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.spaceEvenly),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.spaceAround),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem(MainAxisAlignment.spaceBetween),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem1(CrossAxisAlignment.start),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem1(CrossAxisAlignment.center),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexWithContainerItem1(CrossAxisAlignment.end),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandFlexItem(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandFlexItem1(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandFlexItem2(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandFlexItem3(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildExpandFlexItem4(),
        ],
      ),
    );
  }
}