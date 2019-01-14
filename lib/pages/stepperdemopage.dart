import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StepperDemoPage extends StatefulWidget {
  @override
  _StepperDemoPageState createState() => _StepperDemoPageState();
}

class _StepperDemoPageState extends State<StepperDemoPage> {
  bool _isVertical = true;
  int _currentStep = 0;

  final List<Step> _steps = <Step>[
    Step(
      title: Text('第一步'), 
      isActive: true,
      state: StepState.indexed,
      content: TextFormField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        maxLines: 1,
        onSaved: (String value) {

        },
        validator: (String value) {

        },
        decoration: InputDecoration(
          labelText: '请输入姓名',
          hintText: '您的名字',
          icon: Icon(Icons.person),
          labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    ),
    
    Step(
      title: Text('第二步'),
      isActive: true,
      state: StepState.indexed,
      content: TextFormField(
        keyboardType: TextInputType.phone,
        autocorrect: false,
        maxLines: 1,
        onSaved: (String value) {

        },
        validator: (String value) {

        },
        decoration: InputDecoration(
          labelText: '请输入手机号',
          hintText: '您的手机号',
          icon: Icon(Icons.phone),
          labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    ),

    Step(
      title: Text('第三步'),
      isActive: true,
      state: StepState.indexed,
      content: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        maxLines: 1,
        onSaved: (String value) {

        },
        validator: (String value) {

        },
        decoration: InputDecoration(
          labelText: '请输入Email',
          hintText: '您的Email',
          icon: Icon(Icons.email),
          labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    ),

    Step(
      title: Text('第四步'),
      isActive: true,
      state: StepState.complete,
      content: TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        maxLines: 1,
        onSaved: (String value) {

        },
        validator: (String value) {

        },
        decoration: InputDecoration(
          labelText: '请输入年龄',
          hintText: '您的年龄',
          icon: Icon(Icons.explicit),
          labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    ),
  ];

  Widget _buildiOStepperButtonBar(VoidCallback onStepContinue, VoidCallback onStepCancel) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: <Widget>[
        CupertinoButton(
          onPressed: onStepContinue,
          child: Text('继续'),
          color: CupertinoColors.activeOrange,
        ),
        CupertinoButton(
          onPressed: onStepCancel,
          child: Text('取消'),
          color: CupertinoColors.activeBlue,
        ),
      ],
    );
  }

  Widget _buildAndroidStepperButtonBar(VoidCallback onStepContinue, VoidCallback onStepCancel) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          onPressed: onStepContinue,
          child: Text('继续'),
        ),

        RaisedButton(
          onPressed: onStepCancel,
          child: Text('取消'),
        ),
      ],
    );
  }

  Widget _buildStepper() {
    return Container(
      child: Stepper(
        currentStep: _currentStep,
        steps: _steps,
        type: _isVertical ? StepperType.vertical : StepperType.horizontal,
        controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          if (Theme.of(context).platform == TargetPlatform.iOS) {
            return _buildiOStepperButtonBar(onStepContinue, onStepCancel);
          }

          return _buildAndroidStepperButtonBar(onStepContinue, onStepCancel);
        },
        onStepTapped: (int stepIndex) {
          setState(() { _currentStep = stepIndex; });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep = _currentStep - 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < _steps.length - 1) {
              _currentStep = _currentStep + 1;
            } else {
              _currentStep = 0;
            }
          });
        },
      ),
    );
  }

  Widget _buildiOS() {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('Stepper Demo'),
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: _buildStepper(),
        ),
      ),
    );
  }
  
  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.directions),
            onPressed: () {
              setState(() {
                _isVertical = !_isVertical;
              });
            },
          ),
        ],
      ),
      body: _buildStepper(),
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