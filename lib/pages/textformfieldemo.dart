import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFormFieldDemoPage extends StatefulWidget {
  @override
  _TextFormFieldDemoPageState createState() => _TextFormFieldDemoPageState();
}

class _TextFormFieldDemoPageState extends State<TextFormFieldDemoPage> {

  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusNode _node3 = FocusNode();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _verifyContronller = TextEditingController();

  void _hideKeyboard() {
    _node1.unfocus();
    _node2.unfocus();
    _node3.unfocus();
  }

  List<Widget> _buildTextFormFields() {
    return <Widget>[
      TextFormField(
        controller: _nameController,
        autofocus: true,
        focusNode: _node1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: '用户名',
          hintText: '请输入用户名',
          icon:Icon(Icons.person),
        ),
        onSaved: (String value) {

        },
        validator: (String value) {
          if (value.trim().isEmpty) {
            return '用户名不能为空';
          }
          return null;
        },
      ),

      TextFormField(
        controller: _verifyContronller,
        focusNode: _node2,
        keyboardType: TextInputType.number,
        maxLength: 6,
        decoration: InputDecoration(
          labelText: '验证码',
          hintText: '请输入短信验证码',
          icon: Icon(Icons.confirmation_number),
        ),
        onSaved: (String value) {

        },
        validator: (String value) {
          if (value.trim().isEmpty) {
            return '验证码不能为空';
          }
          return null;
        },
      ),
          
      TextFormField(
        controller: _passwordController,
        focusNode: _node3,
        obscureText: true,
        maxLength: 10,
        decoration: InputDecoration(
          labelText: '密码',
          hintText: '请输入密码',
          icon: Icon(Icons.lock),
        ),
        onSaved: (String value) {

        },
        validator: (String value) {
          if (value.trim().isEmpty) {
            return '密码不能为空';
          }

          return null;
        },
      ),
    ];
  }

  Widget _buildiOS() {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('TextFormField Demo'),
          trailing: CupertinoButton(
            child: Icon(Icons.done),
            onPressed: () {
              _hideKeyboard();
            },
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                top: true,
                bottom: true,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: _buildTextFormFields(),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFormField Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _hideKeyboard();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildTextFormFields(),
      ),
    );
  }

  @override
  void initState() {
      
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _verifyContronller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAndroid();
  }
}