import 'package:flutter/material.dart';
import 'package:deeplearnflutter/modules/demoitem.dart';
import 'materialrowdemopage.dart';
import 'materialcolumndemopage.dart';
import 'containerdemopage.dart';
import 'singlechildscrollviewdemopage.dart';

class MaterialLayoutListPage extends StatelessWidget {
  final List<DemoItem> demos = <DemoItem>[
    DemoItem(icon: Icons.rowing, title: 'Layout Row', subtitle: 'Material Layout Row Demo'),
    DemoItem(icon: Icons.list, title: 'Layout Column', subtitle: 'Material Layout Column Demo'),
    DemoItem(icon: Icons.view_column, title: 'Container', subtitle: 'Material Container Demo'),
    DemoItem(icon: Icons.line_style, title: 'SingleChildScrollView', subtitle: 'Material SingleChildScrollView Demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
      ),
      body: Center(
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
                debugPrint('Material Layout List Page Clicked Cell index:$index');
                if (index == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialRowDemoPage()));
                } else if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialColumnDemoPage()));
                } else if (index == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerDemoPage()));
                } else if (index == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChildScrollViewDemoPage()));
                }
              },
            );
          },
        ),
      ),
    );
  }
}