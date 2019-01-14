import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextDemoPage extends StatelessWidget {

  final List<Widget> texts = <Widget>[
    Text('TextAlign.left', textAlign: TextAlign.left, style: TextStyle(fontSize: 20.0)),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('TextAlign.center', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, color: CupertinoColors.activeOrange)),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('TextAlign.right', textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0, color: CupertinoColors.activeBlue)),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('TextAlign.left', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 16.0)),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('当然，每次非必填参数基本都有一个默认值，具体默认值是什么大家可以点击进去源码看下哦。Text构造方法需要传入一个必须的参数data，也就是String类型的内容。style需要传入需要传入一个TextStyle对象，决定Text的颜色、字体、字体大小、行间距、字体样式等。',
      style: TextStyle(fontSize: 12.0),
      softWrap: true,
      overflow: TextOverflow.clip,
      textScaleFactor: 2.0,
    ),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('夜晚走在喧闹的小街上，反而心能更加的平静，或许这就是物极必反的缘故吧，总喜欢在最吵闹的地方去寻找那一份属于自己的宁静，可以不思考所有的困扰，也可以闭着眼睛静听来自远方的人间天堂的呼唤，然后在忽明忽暗的灯光下丢弃心中的包袱，和一脸的苦闷，再走到起点时，又翻去了一页，也尘封了以往。',
      style: TextStyle(fontSize: 12.0),
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 3.0,
      maxLines: 5,
    ),
    Padding(padding: EdgeInsets.only(top: 10.0)),
    Text('Text 组件是开发中使用到最多的组件，主要控制文本的展示。Text 组件的构造参数可以传入多个属性对象，从而达到控制文字大小、颜色、对齐方式等等特性。Image 组件有5个不同的构造，使得开发者可以从不同的位置去加载图片。Image 组件原生支持webPng和gif图片，不需要使用第三方库。',
      style: TextStyle(fontSize: 14.0, letterSpacing: 5.0),
      softWrap: true,
      overflow: TextOverflow.fade,
      textScaleFactor: 4.0,
      maxLines: 4,
    ),

  ];

  Widget _buildiOS() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '返回',
        middle: Text('Text Demo'),
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
                    return texts[index];
                  },
                  childCount: texts.length,
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
        title: Text('Text Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: texts,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _buildiOS();
    }

    return _buildAnroid();
  }
}