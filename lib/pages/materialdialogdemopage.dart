import 'package:flutter/material.dart';

enum DialogAction { agree, disagree, ignore }

class MaterialDialogDemoPage extends StatefulWidget {
  @override
  _MaterialDialogDemoPageState createState() => _MaterialDialogDemoPageState();
}

class _MaterialDialogDemoPageState extends State<MaterialDialogDemoPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TimeOfDay _selectedTime;

  void _showMaterialDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return child;
      }).then<void>((T value) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('You selected $value')));
      });
  }

  void _showSimpleStringDialog(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    _showMaterialDialog<String>(
      context: context,
      child: AlertDialog(
        content: Text('Material Simple Dialog With back String value', style: dialogTextStyle),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', semanticsLabel: 'Alert OK Button'),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          ),
          FlatButton(
            child: Text('Cancel', semanticsLabel: 'Alert Cancel Button'),
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          ),
        ],
      ),
    );
  }

  void _showSimpleIntDialog(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    _showMaterialDialog<int>(
      context: context,
      child: AlertDialog(
        content: Text('Material Simple Dialog With back Int value', style: dialogTextStyle),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.add_circle),
            label: Text('Yes', semanticsLabel: 'Alert Yes Button'),
            onPressed: () {
              Navigator.pop(context, 0);
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.remove_circle),
            label: Text('No', semanticsLabel: 'Alert No Button'),
            onPressed: () {
              Navigator.pop(context, 1);
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.android),
            label: Text('Android', semanticsLabel: 'Alert android Button'),
            onPressed: () {
              Navigator.pop(context, 2);
            },
          ),
        ],
      ),
    );
  }

  void _showSimpleEnumDialog(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    _showMaterialDialog<DialogAction>(
      context: context,
      child: AlertDialog(
        title: Text('Use Google\'s location service?'),
        content: Text('Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running', style: dialogTextStyle),
        actions: <Widget>[
          RaisedButton(
            child: Text('Agree', semanticsLabel: 'Alert agree Button'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context, DialogAction.agree);
            },
          ),
          RaisedButton(
            child: Text('Disagree', semanticsLabel: 'Alert disagree Button'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context, DialogAction.disagree);
            },
          ),
          RaisedButton(
            child: Text('Ignore', semanticsLabel: 'Alert ignore Button'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context, DialogAction.ignore);
            },
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    _showMaterialDialog<String>(
      context: context,
      child: SimpleDialog(
        title: Text('Simple Dialog'),
        children: <Widget>[
          SimpleDialogOption(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle, color: Colors.teal, size: 36.0),
                Padding(padding: EdgeInsets.only(left: 16.0), child: Text('alimyso@gmail.com')),
              ],
            ),
            onPressed: () {
              Navigator.pop(context, 'alimyso@gmail.com');
            },
          ),
          SimpleDialogOption(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_balance, color: Colors.yellowAccent, size: 36.0),
                Padding(padding: EdgeInsets.only(left: 16.0), child: Text('Google')),
              ],
            ),
            onPressed: () {
              Navigator.pop(context, 'Google');
            },
          ),
          SimpleDialogOption(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_box, color: Colors.redAccent, size: 36.0),
                Padding(padding: EdgeInsets.only(left: 16.0), child: Text('alimyso@hotmail.com')),
              ],
            ),
            onPressed: () {
              Navigator.pop(context, 'alimyso@hotmail.com');
            },
          ),
          SimpleDialogOption(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_balance_wallet, color: Colors.brown, size: 36.0),
                Padding(padding: EdgeInsets.only(left: 16.0), child: Text('alimyso@foxmail.com')),
              ],
            ),
            onPressed: () {
              Navigator.pop(context, 'alimyso@foxmail.com');
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Dialog Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 72.0),
        children: <Widget>[
          RaisedButton(
            child: Text('Simple String Value Dialog'),
            onPressed: () {
              _showSimpleStringDialog(context);
            },
          ),
          RaisedButton(
            child: Text('Simple Int Value Dialog'),
            onPressed: () {
              _showSimpleIntDialog(context);
            },
          ),
          RaisedButton(
            child: Text('Simple Enum Value Dialog'),
            onPressed: () {
              _showSimpleEnumDialog(context);
            },
          ),
          RaisedButton(
            child: Text('Simple Option Dialog'),
            onPressed: () {
              _showSimpleDialog(context);
            },
          ),
          RaisedButton.icon(
            icon: Icon(Icons.calendar_today),
            label: Text('Selected Time'),
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: _selectedTime
              ).then<void>((TimeOfDay value) {
                  if (value != null && value != _selectedTime) {
                    _selectedTime = value;
                    
                  }
              });
            },
          ),
        ].map<Widget>((Widget button) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: button,
          );
        }).toList(),
      ),
    );
  }
}