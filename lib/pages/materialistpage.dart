import 'package:flutter/material.dart';
import 'package:deeplearnflutter/modules/demoitem.dart';
import 'materialbuttonsdemopage.dart';
import 'materialswitchdemopage.dart';
import 'materialdialogdemopage.dart';
import 'materiallayoutlistpage.dart';
import 'snackbardemopage.dart';
import 'bottomsheetdemopage.dart';
import 'drawerdemopage.dart';
import 'textdemopage.dart';
import 'imagedemopage.dart';
import 'icondemopage.dart';
import 'listviewdemopage.dart';
import 'stepperdemopage.dart';
import 'sliverdemopage.dart';
import 'nestedscrollviewdemopage.dart';
import 'expansionpaneldemopage.dart';
import 'customnotificationdemopage.dart';
import 'sliderdemopage.dart';
import 'textfieldemopage.dart';

class MaterialListPage extends StatefulWidget {
  @override
  _MaterialListPageState createState() => _MaterialListPageState();
}

class _MaterialListPageState extends State<MaterialListPage> {
  String message = '';

  final List<DemoItem> demos = <DemoItem>[
    DemoItem(icon: Icons.done, title: 'Buttons', subtitle: 'Material Buttons Demo'),
    DemoItem(icon: Icons.add_alert, title: 'Dialog', subtitle: 'Material Dialog Demo'),
    DemoItem(icon: Icons.local_bar, title: 'SnackBar', subtitle: 'Material SnackBar Demo'),
    DemoItem(icon: Icons.border_bottom, title: 'BottomSheet', subtitle: 'Material BottomSheet Demo'),
    DemoItem(icon: Icons.poll, title: 'Drawer', subtitle: 'Material Drawer Demo'),
    DemoItem(icon: Icons.switch_video, title: 'Switch', subtitle: 'Material Switch Button Demo'),
    DemoItem(icon: Icons.timer, title: 'Picker', subtitle: 'Material Picker Demo'),
    DemoItem(icon: Icons.text_fields, title: 'TextField', subtitle: 'Material TextField Demo'),
    DemoItem(icon: Icons.slideshow, title: 'Slider', subtitle: 'Material Slider Demo'),
    DemoItem(icon: Icons.track_changes, title: 'Progress', subtitle: 'Material Progress Demo'),
    DemoItem(icon: Icons.list, title: 'ListView', subtitle: 'Material ListView Demo'),
    DemoItem(icon: Icons.view_list, title: 'GridList', subtitle: 'Material GridList Demo'),
    DemoItem(icon: Icons.tab, title: 'Tab', subtitle: 'Material Tab Demo'),
    DemoItem(icon: Icons.format_align_left, title: 'Layout', subtitle: 'Material Layout Demo'),
    DemoItem(icon: Icons.texture, title: 'Text', subtitle: 'Material Text Demo'),
    DemoItem(icon: Icons.image, title: 'Image', subtitle: 'Material Image Demo'),
    DemoItem(icon: Icons.image_aspect_ratio, title: 'Icon', subtitle: 'Material Icon Demo'),
    DemoItem(icon: Icons.linear_scale, title: 'Stepper', subtitle: 'Material Stepper Demo'),
    DemoItem(icon: Icons.last_page, title: 'Sliver', subtitle: 'Material Sliver Demo'),
    DemoItem(icon: Icons.dock, title: 'NestedScrollView', subtitle: 'Material NestedScrollView Demo'),
    DemoItem(icon: Icons.pie_chart_outlined, title: 'ExpansionPanel', subtitle: 'Material ExpansionPanel Demo'),
    DemoItem(icon: Icons.notifications, title: 'CustomNotification', subtitle: 'Custom Notification Demo'),
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message == '' ? 'Material' : message),
      ),
      body: NotificationListener<CustomNotification>(
        onNotification: (CustomNotification notification) {
          setState(() { 
            debugPrint('已收到:${notification.message}');
            message = notification.message; 
          });
        },
        child: Center(
          child: ListView.separated(
            itemCount: demos.length,
            separatorBuilder: (BuildContext context, int index) => Divider(color: Theme.of(context).dividerColor),
            itemBuilder: (BuildContext context, int index) {
              final DemoItem item = demos[index];
              return ListTile(
                leading: Icon(item.icon),
                title: Text(item.title, style: TextStyle(fontSize: 20.0)),
                subtitle: Text(item.subtitle, style: TextStyle(fontSize: 13.0)),
                onTap: () {
                  debugPrint('Material List Page Clicked Cell index:$index');
                  if (index == 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialButtonsDemoPage()));
                  } else if (index == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialDialogDemoPage()));
                  } else if (index == 2) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SnackBarDemoPage()));
                  } else if (index == 3) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomSheetDemoPage()));
                  } else if (index == 4) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerDemoPage()));
                  } else if (index == 5) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialSwitchDemoPage()));
                  } else if (index == 7) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TextFieldDemoPage()));
                  } else if (index == 8) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SliderDemoPage()));
                  } else if (index == 10) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewDemoPage()));
                  } else if (index == 13) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialLayoutListPage()));
                  } else if (index == 14) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TextDemoPage()));
                  } else if (index == 15) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDemoPage()));
                  } else if (index == 16) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IconDemoPage()));
                  } else if (index == 17) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StepperDemoPage()));
                  } else if (index == 18) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SliverDemoPage()));
                  } else if (index == 19) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NestedScrollViewDemoPage()));
                  } else if (index == 20) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionPanelDemoPage()));
                  } else if (index == 21) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomNotificationDemoPage()));
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  } 
}