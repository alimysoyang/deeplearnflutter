import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  final String message;
  CustomNotification(this.message);
}

class CustomNotificationDemoPage extends StatefulWidget {
  @override
  _CustomNotificationDemoPageState createState() => _CustomNotificationDemoPageState();
}

class _CustomNotificationDemoPageState extends State<CustomNotificationDemoPage> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message == '' ? 'Custom Notification Demo' : message),
      ),
      body: NotificationListener<CustomNotification>(
        onNotification: (CustomNotification notification) {
          setState(() {
            debugPrint('收到消息:${notification.message}');
            message = notification.message;
          });
        },
        child: Builder(
          builder: (BuildContext context) {
            return Center(
              child: RaisedButton(
                child: Text('Send Notification'),
                onPressed: () {
                  CustomNotification('Hello Send Notification').dispatch(context);
                  debugPrint('已发送CustomNotification');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}