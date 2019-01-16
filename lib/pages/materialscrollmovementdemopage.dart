import 'package:flutter/material.dart';

class MaterialScrollMovementDemoPage extends StatefulWidget {

  @override
  _MaterialScrollMovementDemoPageState createState() => _MaterialScrollMovementDemoPageState();
}

class _MaterialScrollMovementDemoPageState extends State<MaterialScrollMovementDemoPage> {

  final double itemSize = 100.0;

  String message = '';
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _moveUp() {
    _controller.animateTo(_controller.offset - itemSize, curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  void _moveDown() {
    _controller.animateTo(_controller.offset + itemSize, curve: Curves.linear, duration: Duration(microseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Movement'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text('up'),
                    onPressed: _moveUp,
                  ),
                  RaisedButton(
                    child: Text('down'),
                    onPressed: _moveDown,
                  ),
                ]
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemExtent: itemSize,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Index $index'));
              },
            ),
          ),
        ],
      ),
    );
  }
}