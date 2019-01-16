import 'package:flutter/material.dart';

class MaterialScrollStatusDemoPage extends StatefulWidget {

  @override
  _MaterialScrollStatusDemoPageState createState() => _MaterialScrollStatusDemoPageState();
}

class _MaterialScrollStatusDemoPageState extends State<MaterialScrollStatusDemoPage> {

  String message = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onStartScroll(ScrollMetrics metrics) {
    setState(() { message = 'Scroll Start'; });
  }
  
  void _onUpateScroll(ScrollMetrics metrics) {
    setState(() { message = 'Scroll Update'; });
  }

  void _onEndScroll(ScrollMetrics metrics) {
    setState(() { message = 'Scroll End'; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Status'),
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
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }
              },
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Index $index'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}