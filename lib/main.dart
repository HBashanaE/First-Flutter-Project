import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = '0';
  Widget buildButton(buttontext) {
    return new Expanded(
      child: new OutlineButton(
        child: new Text(
          buttontext,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(24),
        onPressed: () => {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
                child: new Text(
              '8',
              style: TextStyle(fontSize: 48.0),
            )),
            new Expanded(
              child: new Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('/')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('-')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('Clear'),
                    buildButton('='),
                  ],
                ),
              ],
            )
          ],
        )));
  }
}
