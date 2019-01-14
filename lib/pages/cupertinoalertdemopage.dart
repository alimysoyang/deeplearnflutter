import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef void ClickedCallback(int index);

enum CupertinoAlertDemoType { ok, cancel, dismiss }

class DessertDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final ClickedCallback onClicked;

  DessertDialog({ Key key, this.title, this.content, this.onClicked });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('1'),
          onPressed: () {
            onClicked(1);
            Navigator.pop(context, 1);
          },
        ),

        CupertinoDialogAction(
          child: Text('2'),
          onPressed: () {
            onClicked(2);
            Navigator.pop(context, 2);
          },
        ),

        CupertinoDialogAction(
          child: Text('3'),
          onPressed: () {
            onClicked(3);
            Navigator.pop(context, 3);
          },
        ),

        CupertinoDialogAction(
          child: Text('4'),
          onPressed: () {
            onClicked(4);
            Navigator.pop(context, 4);
          },
        ),

        CupertinoDialogAction(
          child: Text('5'),
          onPressed: () {
            onClicked(5);
            Navigator.pop(context, 5);
          },
        ),
      ],
    );
  }
}

class CupertinoAlertDemoPage extends StatefulWidget {
  @override
  _CupertinoAlertDemoPageState createState() => _CupertinoAlertDemoPageState();
}

class _CupertinoAlertDemoPageState extends State<CupertinoAlertDemoPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showCupertinoDialog<T>({BuildContext context, Widget child}) {
    showCupertinoDialog<T>(
      context: context,
      builder: (BuildContext context) {
          return child;
      }
    ).then<void>((T value) {
      debugPrint('Dialog You selected $value');
    });
  }

  void _showCupertinoModalPopup<T>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) {
        return child;
      }
    ).then<void>((T value) {
      debugPrint('ActionSheet You selected $value');
    });
  }

  void _show(BuildContext context) {
    _showCupertinoDialog<CupertinoAlertDemoType>(
      context: context,
      child: CupertinoAlertDialog(
        title: Text('information'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context, CupertinoAlertDemoType.ok);
            },
          ),
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, CupertinoAlertDemoType.cancel);
            },
          ),
        ],
      ),
    );
  }

  void _showInt(BuildContext context) {
    _showCupertinoDialog<int>(
      context: context,
      child: CupertinoAlertDialog(
        title: Text('information'),
        content: Text('Back Int Value'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context, 1);
            },
          ),
          CupertinoDialogAction(
            child: Text('Cance'),
            onPressed: () {
              Navigator.pop(context, 0);
            },
          ),
        ],
      ),
    );
  }

  void _showEnumSheet(BuildContext context) {
    _showCupertinoModalPopup<CupertinoAlertDemoType>(
      context: context,
      child: CupertinoActionSheet(
        title: Text('Favorite Dessert'),
        message: Text('Please select the best dessert from the options below'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('OK'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, CupertinoAlertDemoType.ok);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, CupertinoAlertDemoType.cancel);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Dismiss'),
            onPressed: () {
              Navigator.pop(context, CupertinoAlertDemoType.dismiss);
            },
          ),
        ],
      ),
    );
  }

  void _showIntSheet(BuildContext context) {
    _showCupertinoModalPopup<int>(
      context: context,
      child: CupertinoActionSheet(
        title: Text('Favorite Dessert'),
        message: Text('Please select the best dessert from the options below'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('确定'),
            onPressed: () {
              Navigator.pop(context, 0);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('释放'),
            onPressed: () {
              Navigator.pop(context, 1);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('哈哈😆'),
            onPressed: () {
              Navigator.pop(context, 2);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context, 3);
          },
        ),
      ),
    );
  }

  void _showPopupSurface(BuildContext context) {
    final List<Widget> views = <Widget>[
      Padding(padding: EdgeInsets.only(top: 20.0)),
      Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546495703715&di=a08d86529a624c62f3272db454cdd184&imgtype=0&src=http%3A%2F%2Fi-7.vcimg.com%2Ftrim%2F1bbeea84413b84819efe628a22f5a5f9179536%2Ftrim.jpg'),
      Padding(padding: EdgeInsets.only(top: 20.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            child: Text('OK'),
            color: CupertinoColors.destructiveRed,
            onPressed: () {
              Navigator.pop(context, 'ok');
            },
          ),
          Padding(padding: EdgeInsets.only(left: 4.0, right: 4.0)),
          CupertinoButton(
            child: Text('Close'),
            color: CupertinoColors.activeBlue,
            onPressed: () {
              Navigator.pop(context, 'close');
            },
          ),
        ],
      ),
    ];

    _showCupertinoDialog<String>(
      context: context,
      child: CupertinoPopupSurface(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                top: true,
                bottom: true,
                minimum: EdgeInsets.only(left: 5.0, right: 5.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return views[index];
                    },
                    childCount: views.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionalDialog(BuildContext context) {
    _showCupertinoDialog<int>(
      context: context,
      child: DessertDialog(
        title: Text('弹出'),
        content: Text('自定义对话框'),
        onClicked: (int index) {
          debugPrint('Clicked $index');
        },
      ),
    );
  }

  Widget _buildSimpleAlertButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Alert'),
      color: CupertinoColors.activeBlue,
      onPressed: () {
        _show(context);
      },
    );
  }

  Widget _buildSimpleIntAlertButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Int Alert'),
      color: CupertinoColors.activeGreen,
      onPressed: () {
        _showInt(context);
      },
    );
  }

  Widget _buildSimpleActionSheetButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Enum ActionSheet'),
      color: CupertinoColors.activeOrange,
      onPressed: () {
        _showEnumSheet(context);
      },
    );
  }

  Widget _buildSimpleIntActionSheetButton(BuildContext context) {
    return CupertinoButton(
      child: Text('Int ActionSheet'),
      color: CupertinoColors.darkBackgroundGray,
      onPressed: () {
        _showIntSheet(context);
      },
    );
  }

  Widget _buildOptionDialog(BuildContext context) {
    return CupertinoButton(
      child: Text('Optional Dialog'),
      color: CupertinoColors.destructiveRed,
      onPressed: () {
        _showOptionalDialog(context);
      },
    );
  }

  Widget _buildPopupSurface(BuildContext context) {
    return CupertinoButton(
      child: Text('Popup Surface'),
      color: CupertinoColors.activeOrange,
      onPressed: () {
        _showPopupSurface(context);
      },
    );
  }

  @override 
  Widget build(BuildContext context) {
    final List<Widget> buttons = <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildSimpleAlertButton(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildSimpleIntAlertButton(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildSimpleActionSheetButton(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildSimpleIntActionSheetButton(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildOptionDialog(context),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildPopupSurface(context),
    ];

    return CupertinoPageScaffold(
      key: _scaffoldKey,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Alert'),
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
                    return buttons[index];
                  },
                  childCount: buttons.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );  
  }
}