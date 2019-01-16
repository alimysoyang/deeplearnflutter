import 'package:flutter/material.dart';

class MaterialScrollLimitReachedDemoPage extends StatefulWidget {

  @override
  _MaterialScrollLimitReachedDemoPageState createState() => _MaterialScrollLimitReachedDemoPageState();
}

class _MaterialScrollLimitReachedDemoPageState extends State<MaterialScrollLimitReachedDemoPage> {

  String message = '';
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      setState(() { message = 'reach the bottom'; });
    } else if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      setState(() { message = 'reach the top'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Limit Reached'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: Center(
              child: Text(message),
            ),
          ),

          Expanded(
            child: ListView.builder(
              controller: _controller,
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