import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:deeplearnflutter/modules/iofile.dart';
import 'dart:io';

enum FileSystemType { newDirectory, newFile, deleteFile }

class FileSystemDemoPage extends StatefulWidget {

  @override
  _FileSystemDemoPageState createState() => _FileSystemDemoPageState();
}

class _FileSystemDemoPageState extends State<FileSystemDemoPage> {
  final List<String> titles = <String>[
    '显示目录',
    '创建目录',
    '写文件',
    '读文件',
    '删除文件',
    '修改文件名',
    '删除文件夹',
  ];

  final IOFile _ioFile = IOFile();

  String _inputValue = '';

  void _androidPopup<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return child;
      }
    ).then<void>((T value) {

    });
  }

  void _iosPopup<T>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) {
        return child;
      }
    ).then<void>((T value) {

    });
  }

  void _showAndroidInput(BuildContext context) {
    _androidPopup<String>(
      context: context,
      child: AlertDialog(
        content: TextField(
          textCapitalization: TextCapitalization.characters,
          autocorrect: false,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: '请输入文件夹名',
            hintStyle: TextStyle(fontSize: 13.0),
            prefixIcon: Icon(Icons.edit),
          ),
          onChanged: (String value) {
            setState(() { _inputValue = value; });
          },
          onSubmitted: (String value) {
            setState(() { _inputValue = value; });
          },
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text('确定', style: TextStyle(color: Colors.white)),
            color: Colors.redAccent,
              onPressed: () {
                Navigator.pop(context, _inputValue);
                _ioFile.createDirectory(_inputValue);
              },
          ),
          RaisedButton(
            child: Text('取消', style: TextStyle(color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.pop(context, '');
            },
          ),
        ],
      ),  
    );
  }

  void _showiOSInput(BuildContext context) {
    _iosPopup<String>(
      context: context, 
      child: CupertinoAlertDialog(
        content: CupertinoTextField(
          prefix: Icon(CupertinoIcons.pen, color: CupertinoColors.lightBackgroundGray, size: 24.0),
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
          clearButtonMode: OverlayVisibilityMode.editing,
          textCapitalization: TextCapitalization.characters,
          autocorrect: false,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
          ),
          placeholder: '文件夹名',
          onChanged: (String  value) {
            setState(() { _inputValue = value; });
          },
          onSubmitted: (String value) {
            setState(() { _inputValue = value; });
          },
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('确定'),
            onPressed: () {
              Navigator.pop(context, _inputValue);
              _ioFile.createDirectory(_inputValue);
            },
          ),
          CupertinoDialogAction(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, '');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(titles[index]),
          onTap: () {
            if (index == 0) {
              _ioFile.showDir();
              // if (Platform.isAndroid) {
              //   _ioFile.startShowAndroid();
              // }
            } else if (index == 1) {
              if (Platform.isIOS) {
                _showiOSInput(context);
              } else if (Platform.isAndroid) {
                _showAndroidInput(context);
              }
            } else if (index == 2) {

            } else if (index == 3) {

            } else if (index == 4) {

            } else if (index == 5) {

            }
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.black26);
      },
    );
  }

  Widget _buildiOS() {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: '返回',
          middle: Text('File System Demo'),
        ),
        child: _buildListView(),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('File System Demo'),
      ),
      body: _buildListView(),
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