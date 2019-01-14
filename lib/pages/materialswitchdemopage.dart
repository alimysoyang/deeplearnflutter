import 'package:flutter/material.dart';

class MaterialSwitchDemoPage extends StatefulWidget {
  @override
  _MaterialSwitchDemoPageState createState() => _MaterialSwitchDemoPageState();
}

class _MaterialSwitchDemoPageState extends State<MaterialSwitchDemoPage> {

  bool _isTrue = true;
  bool _isListTrue = true;

  Widget _buildNormalSwitch() {
    return Semantics(
      container: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: _isTrue,
            onChanged: (bool value) {
              setState(() {
                _isTrue = !_isTrue;
              });
            },
          ),
          Text('Active'),
        ],
      ),
    );
  }

  Widget _buildDisableTrueSwitch() {
    return Semantics(
      container: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: true,
            onChanged: null,
          ),
          Text('Disable'),
        ],
      ),
    );
  }

  Widget _buildDisableFalseSwitch() {
    return Semantics(
      container: true,
      child: Column(
        children: <Widget>[
          Switch(
            value: false,
            onChanged: null,
          ),
          Text('Disable'),
        ],
      ),
    );
  }

  Widget _buildSwitchTile() {
    return SwitchListTile(
      title: Text('关注提醒'),
      value: _isListTrue,
      onChanged: (bool value) {
        setState(() { 
          _isListTrue = !_isListTrue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildNormalSwitch(),
            _buildDisableTrueSwitch(),
            _buildDisableFalseSwitch(),
            _buildSwitchTile(),
          ],
        ),
      ),
    );
  }
}