import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImageDemoPage extends StatelessWidget {

  //
  final List<Widget> images = <Widget>[
    Image.asset('images/login_bobo_logo.png'),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Image.asset('images/login_bobo_logo.png', width:50.0, height: 50.0),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546495674781&di=3821048efa0b77e464a6edf1647be11a&imgtype=0&src=http%3A%2F%2Fpic16.nipic.com%2F20110920%2F8337715_111252411000_2.jpg'),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546495703715&di=a08d86529a624c62f3272db454cdd184&imgtype=0&src=http%3A%2F%2Fi-7.vcimg.com%2Ftrim%2F1bbeea84413b84819efe628a22f5a5f9179536%2Ftrim.jpg'),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Image.network('https://b-ssl.duitang.com/uploads/blog/201409/24/20140924175702_YQC4H.thumb.700_0.gif'),
  ];

  List<Widget> _blendModeImages() {
    var urlPath = 'http://img.52z.com/upload/news/image/20181108/20181108204521_78276.jpg';
    List<Widget> retVal = <Widget>[];
    BlendMode.values.forEach((BlendMode mode) {
      retVal.add(
        Column(
          children: <Widget>[
            Padding(child: Image.network(urlPath, width: 60.0, height: 60.0, color: Colors.red, colorBlendMode: mode), padding: EdgeInsets.all(5.0)),
            Text(mode.toString().split('.')[1], style: TextStyle(fontSize: 14.0)),
          ],
        )
      );
    });
    return retVal;
  }

  List<Widget> _fitImages() {
    var urlPath = 'http://img.52z.com/upload/news/image/20181108/20181108204521_78276.jpg';
    List<Widget> retVal = <Widget>[];
    BoxFit.values.forEach((BoxFit fit) {
      retVal.add(
        Column(
          children: <Widget>[
            Padding(child: Image.network(urlPath, width: 60.0, height: 60.0, fit: fit), padding: EdgeInsets.all(5.0)),
            Text(fit.toString().split('.')[1], style: TextStyle(fontSize: 14.0)),
          ],
        )
      );
    });
    return retVal;
  }

  Widget _buildiOS() {
    var _imageItems = <Widget>[];
    _blendModeImages().forEach((Widget item) {
      _imageItems.add(item);
    });
    _fitImages().forEach((Widget item) {
      _imageItems.add(item);
    });
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Image Demo'),
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
                    return _imageItems[index];
                  },
                  childCount: _imageItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAndroid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: images,
      ),
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
