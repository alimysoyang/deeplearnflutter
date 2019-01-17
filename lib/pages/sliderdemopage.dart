import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliderDemoPage extends StatefulWidget {

  @override
  _SliderDemoPageState createState() => _SliderDemoPageState();
}

class _SliderDemoPageState extends State<SliderDemoPage> {

  double _value1 = 0.0;
  double _value2 = 50.0;

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Slider Demo'),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverSafeArea(
              top: true,
              bottom: true,
              minimum: EdgeInsets.only(left: 10.0, right: 10.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 60.0, bottom: 60.0),
                          child: CupertinoSlider(
                            value: _value1,
                            onChanged: (double value) {
                              setState(() { _value1 = value; });
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 60.0),
                          child: CupertinoSlider(
                            min: 0.0,
                            max: 100.0,
                            value: _value2,
                            divisions: 400,
                            activeColor: CupertinoColors.activeOrange,
                            onChanged: (double value) {
                              setState(() { _value2 = value; });
                            },
                          ),
                        ),
                      ],
                    );
                  },  
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Demo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0, bottom: 60.0),
            child: Slider(
              min: 0.0,
              max: 100.0,
              value: _value2,
              divisions: 400,
              activeColor: Colors.blue,
              inactiveColor: Colors.blueGrey,
              label: _value2.toString(),
              onChanged: (double value) {
                setState(() { _value2 = value; });
              },
            )
          ),
          
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Slider(
              value: _value1,
              label: _value1.toString(),
              onChanged: (double value) {
                setState(() { _value1 = value; });
              },
            ),
          ),
        ],
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