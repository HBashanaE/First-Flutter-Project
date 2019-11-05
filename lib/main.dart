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
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String opprand = '';

  buttonPressed(String buttonText){
    if(buttonText == 'Clear'){
      output = '0';
      _output = '';
      num1 = 0.0;
      num2 = 0.0;
      opprand = '';
    } else if(buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/'){
      num1 = double.parse(_output);
      // num2 = double.parse(output);
      opprand = buttonText;
      _output = '';

    }else if(buttonText == '.'){
      if(_output.contains('.')){
        print('Error adding another decimal point');
        return;
      }else{
        _output = _output + buttonText;
      }
    }else if(buttonText == '='){
      num2 = double.parse(_output);

      if(opprand == '+'){
        _output = (num1 + num2).toString();
      }else if(opprand == '-'){
        _output = (num1 - num2).toString();
      }else if(opprand == '*'){
        _output = (num1 * num2).toString();
      }else if(opprand == '/'){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      _output = '0';
      opprand = '';
    }else{
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
    print(buttonText);
  }

  Widget buildButton(buttonText) {
    return new Expanded(
      child: new OutlineButton(
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(24),
        onPressed: () => buttonPressed(buttonText),
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
              output,
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
