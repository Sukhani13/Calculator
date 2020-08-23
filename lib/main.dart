import 'package:flutter/material.dart';
import 'package:miCalculator/customButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expression = '';
  String history = '';
  bool theme = true;

  void showNum(String text) {
    if (text == 'AC') {
      setState(() {
        expression = '';
        history = '';
      });
    } else if (text == 'C') {
      setState(() {
        expression = expression.substring(0, expression.length - 1);
      });
    } else if (text == '=') {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        history = expression;
        expression = eval.toString();
      });
    } else {
      setState(() {
        expression += text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme ? null : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                theme ? Icons.wb_sunny : Icons.star,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  theme = !theme;
                });
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  expression,
                  style: TextStyle(fontSize: 45),
                ),
                alignment: Alignment.bottomRight,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  CustomButton('AC', showNum),
                  CustomButton('C', showNum),
                  CustomButton('%', showNum),
                  CustomButton('/', showNum),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('7', showNum),
                  CustomButton('8', showNum),
                  CustomButton('9', showNum),
                  CustomButton('*', showNum),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('4', showNum),
                  CustomButton('5', showNum),
                  CustomButton('6', showNum),
                  CustomButton('-', showNum),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('1', showNum),
                  CustomButton('2', showNum),
                  CustomButton('3', showNum),
                  CustomButton('+', showNum),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('.', showNum),
                  CustomButton('0', showNum),
                  CustomButton('00', showNum),
                  CustomButton('=', showNum),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
