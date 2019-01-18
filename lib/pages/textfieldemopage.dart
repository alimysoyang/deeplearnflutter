import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {

  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusNode _node3 = FocusNode();
  FocusNode _node4 = FocusNode();

  TextEditingController _nameController = TextEditingController();

  void _hideKeyboard() {
    _node1.unfocus();
    _node2.unfocus();
    _node3.unfocus();
    _node4.unfocus();
  }

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('TextField Demo'),
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
              minimum: EdgeInsets.only(left: 10.0, right: 10.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CupertinoTextField(
                          autofocus: true,
                          focusNode: _node1,
                          textInputAction: TextInputAction.next,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          prefix: Icon(Icons.person),
                          placeholder: '请输入用户名',
                          onChanged: (String value) {

                          },
                          onSubmitted: (String value) {

                          },
                        ),
                        CupertinoTextField(
                          maxLength: 12,
                          focusNode: _node2,
                          textInputAction: TextInputAction.next,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          obscureText: true,
                          prefix: Icon(Icons.lock),
                          placeholder: '请输入长度8位以上的密码',
                          onChanged: (String value) {

                          },
                          onSubmitted: (String value) {

                          },
                        ),

                        CupertinoTextField(
                          maxLines: 30,
                          focusNode: _node3,
                          textInputAction: TextInputAction.done,
                          onChanged: (String value) {

                          },
                          onSubmitted: (String value) {

                          },
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

  Widget _buildAnroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _hideKeyboard();

            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              autofocus: true,
              focusNode: _node1,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (String value) {

              },
              onSubmitted: (String value) {

              },
            ),

            TextField(
              maxLength: 12,
              focusNode: _node2,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入长度8位以上的密码',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              onChanged: (String value) {

              },
              onSubmitted: (String value) {

              },
            ),

            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey[200], width: 1.0)),
              child: TextField(
                focusNode: _node3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: '请输入Email',
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,             //无下划线
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(bottom: 30.0)),

            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey[400], width: 1.0), borderRadius: BorderRadius.circular(5.0)),
              child: TextField(
                focusNode: _node4,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (String value) {

                },
                onSubmitted: (String value) {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _nameController.addListener(() {
      print(_nameController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAnroid();
  }
}