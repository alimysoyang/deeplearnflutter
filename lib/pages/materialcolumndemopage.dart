import 'package:flutter/material.dart';

class MaterialColumnDemoPage extends StatelessWidget {

  Widget _buildTextsColumn() {
    return Column(
      children: <Widget>[
        Text('绝域从军计惘然，CrossAxisAlignment.center', style: TextStyle(fontSize: 12.0)),
        Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)),
        Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)),
        Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildRowAndColumnTexts() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('绝域从军计惘然，', style: TextStyle(fontSize: 12.0)),
            Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)),
          ],
        ),
        Text('06:45'),
      ],
    );
  }

  Widget _buildRowAndColumnExpand() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('绝域从军计惘然，CrossAxisAlignment.start', style: TextStyle(fontSize: 12.0)),
              Text('东南幽恨满词笺。Expanded', style: TextStyle(fontSize: 12.0)),
            ],
          ),
        ),
        Text('大空间打开'),
      ],
    );
  }

  Widget _buildTextsColumn1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(child: Text('绝域从军计惘然，CrossAxisAlignment.end', style: TextStyle(fontSize: 12.0)), color: Colors.blue),
        Container(child: Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)), color: Colors.yellow),
        Container(child: Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)), color: Colors.teal),
        Container(child: Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)), color: Colors.lightGreen),
      ],
    );
  }

  Widget _buildTextsColumn2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(child:Text('绝域从军计惘然，CrossAxisAlignment.start', style: TextStyle(fontSize: 12.0)), color: Colors.blue),
        Container(child:Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)), color: Colors.yellow),
        Container(child:Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)), color: Colors.teal),
        Container(child:Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)), color: Colors.lightGreen),
      ],
    );
  }

  Widget _buildTextsColumn3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(child:Text('绝域从军计惘然，CrossAxisAlignment.stretch', style: TextStyle(fontSize: 12.0)), color: Colors.blue),
        Container(child:Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)), color: Colors.yellow),
        Container(child:Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)), color: Colors.teal),
        Container(child:Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)), color: Colors.lightGreen),
      ],
    );
  }

  Widget _buildFlexColumn() {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(child:Text('绝域从军计惘然，CrossAxisAlignment.center', style: TextStyle(fontSize: 12.0)), color: Colors.blue),
        Container(child:Text('东南幽恨满词笺。', style: TextStyle(fontSize: 12.0)), color: Colors.yellow),
        Container(child:Text('一箫一剑平生意，', style: TextStyle(fontSize: 12.0)), color: Colors.teal),
        Offstage(child: Container(child:Text('负尽狂名十五年。', style: TextStyle(fontSize: 12.0)), color: Colors.lightGreen), offstage: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout with Column Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        children: <Widget>[
          _buildTextsColumn(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildRowAndColumnTexts(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildRowAndColumnExpand(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildTextsColumn1(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildTextsColumn2(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildTextsColumn3(),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          _buildFlexColumn(),
        ],
      ),
    );
  }
}