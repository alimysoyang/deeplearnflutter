import 'package:flutter/material.dart';

String dropdownValue1 = 'Free';
String dropdownValue2;
String dropdownValue3 = '5';

bool iconButtonToggle = false;

class MaterialButtonsDemoPage extends StatefulWidget {
  @override
  _MaterialButtonsDemoPageState createState() => _MaterialButtonsDemoPageState();
}

class _MaterialButtonsDemoPageState extends State<MaterialButtonsDemoPage> {

  Widget _buildMaterialButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MaterialButton(
            child: Text('MATERIAL BUTTON', semanticsLabel: 'MATERIAL BUTTON 1', style: TextStyle(fontSize: 13.0)),
            elevation: 1.0,
            onPressed: () {

            },
          ),

          MaterialButton(
            child: Text('MATERIAL DISABLE BUTTON', semanticsLabel: 'MATERIAL DISABLE BUTTON 1', style: TextStyle(fontSize: 13.0)),
            onPressed: null,
          ),

        ],
      ),
    );
  }

  Widget _buildRaisedButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text('RAISED BUTTON', semanticsLabel: 'RAISED BUTTON 1'),
                elevation: 1.0,
                color: Color(0xFFF88B0A),
                highlightColor: Colors.blue,
                onPressed: () {},
              ),

              RaisedButton(
                child: Text('DISABLED RAISED BUTTON', semanticsLabel: 'DISABLED RAISED BUTTON 1'),
                onPressed: null,
              ),
            ],
          ),

          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.add, size: 18.0),
                label: Text('RAISED BUTTON', semanticsLabel: 'RAISED BUTTON 2', style: TextStyle(fontSize: 11.0)),
                elevation: 1.0,
                color: Color(0xFFF88B0A),
                highlightColor: Colors.blueGrey,
                onPressed: () {},
              ),
              RaisedButton.icon(
                icon: Icon(Icons.add, size: 18.0),
                label: Text('DISABLED RAISED BUTTON', semanticsLabel: 'DISABLED RAISED BUTTON 2', style: TextStyle(fontSize: 11.0)),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlatButton() {
    return Align(
      alignment: Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                child: Text('FLAT BUTTON', semanticsLabel: 'FLAT BUTTON 1'),
                color: Color(0xFFF88B0A),
                highlightColor: Colors.blue,
                textColor: Color(0xFFEFFFFF),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('DISABLED', semanticsLabel: 'DISABLED 3'),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add_circle_outline,size: 18.0),
                label: Text('FLAT BUTTON', semanticsLabel: 'FLAT BUTTON 2'),
                onPressed: () {},
              ),
              FlatButton.icon(
                icon: Icon(Icons.add_circle_outline, size: 18.0),
                label: Text('DISABLED', semanticsLabel: 'DISABLED 4'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutlineButton() {
    return Align(
      alignment: Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OutlineButton(
                child: Text('OUTLINE BUTTON', semanticsLabel: 'OUTLINE BUTTON 1'),
                color: Color(0xFFF88B0A),
                highlightColor: Colors.blue,
                textColor: Color(0xFF000000),
                borderSide: BorderSide(color: Color(0xFF0A66F8), width: 2),
                onPressed: () {

                },
              ),
              OutlineButton(
                child: Text('DISABLED', semanticsLabel: 'DISABLED 5'),
                color: Color(0xFFF88B0A),
                highlightColor: Colors.blue,
                textColor: Color(0xFF000000),
                borderSide: BorderSide(color: Color(0xFF0A66F8), width: 2),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OutlineButton.icon(
                icon: Icon(Icons.add, size: 18.0),
                label: Text('OUTLINE BUTTON', semanticsLabel: 'OUTLINE BUTTON 2'),
                onPressed: () {

                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add, size: 18.0),
                label: Text('DISABLED', semanticsLabel: 'DISABLED 6'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropdownButton(
            value: dropdownValue1,
            onChanged: (String newValue) {
              setState(() { dropdownValue1 = newValue; });
            },
            items: <String>['One', 'Two', 'Free', 'Four', 'Five'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          SizedBox(height: 24.0),

          DropdownButton<String>(
            value: dropdownValue2,
            hint: Text('Choose'),
            onChanged: (String newValue) {
              setState(() { dropdownValue2 = newValue; });
            },
            items: <String>['AAA', 'BBB', 'CCC', 'DDD', 'EEE'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          SizedBox(height: 24.0),

          DropdownButton<String>(
            value: dropdownValue3,
            onChanged: (String newValue) {
              setState(() { dropdownValue3 = newValue; });
            },
            items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton() {
    return Align(
      alignment: Alignment(0.0, -0.2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.thumb_up, semanticLabel: 'Thumbs up'),
            color: iconButtonToggle ? Theme.of(context).primaryColor : null,
            onPressed: () {
              setState(() { iconButtonToggle = !iconButtonToggle; });
            },
          ),
          IconButton(
            icon: Icon(Icons.thumb_up, semanticLabel: 'Thumbs not up'),
            onPressed: null,
          ),
        ].map<Widget>((Widget button) {
          return SizedBox(
            width: 64.0,
            height: 64.0,
            child: button,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.timeline),
      tooltip: 'floating action button',
      onPressed: () {

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Demo', style: TextStyle(fontSize: 18.0)),
        elevation: 10,
        centerTitle: true,
        toolbarOpacity: 0.6,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildMaterialButton(),
              _buildRaisedButton(),
              _buildFlatButton(),
              _buildOutlineButton(),
              _buildDropdownButton(),
              _buildIconButton(),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}