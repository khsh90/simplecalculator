import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget bulidButton(String buttonName, buttonHieght, Color backGroundColor) {
    return Container(
      height: MediaQuery.of(context).size.height * .10 * buttonHieght,
      color: backGroundColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: const EdgeInsets.all(16),
        onPressed: () => buttonTxt(buttonName),
        child: Text(
          buttonName,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38;
  double resultFontSize = 48;

  void buttonTxt(String btnText) {
    setState(() {
      if (btnText == 'C') {
        equation = '0';
       
        result = '0';
        equationFontSize = 38;
        resultFontSize = 48;
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = '0';
          equationFontSize = 48;
          resultFontSize = 38;
        }
      } else if (btnText == "=") {
        equationFontSize = 48;
        resultFontSize = 38;
        expression = equation;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('×', '*');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else if (equation == '0') {
        equation = btnText;
      } else {
        equation += btnText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Hadidid Calculator',
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          const Expanded(
              child: Divider(
            color: Colors.white,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      bulidButton('C', 1, Colors.redAccent),
                      bulidButton('⌫', 1, Colors.blue),
                      bulidButton('÷', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      bulidButton('7', 1, Colors.black54),
                      bulidButton('8', 1, Colors.black54),
                      bulidButton('9', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      bulidButton('4', 1, Colors.black54),
                      bulidButton('5', 1, Colors.black54),
                      bulidButton('6', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      bulidButton('1', 1, Colors.black54),
                      bulidButton('2', 1, Colors.black54),
                      bulidButton('3', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      bulidButton('.', 1, Colors.black54),
                      bulidButton('0', 1, Colors.black54),
                      bulidButton('00', 1, Colors.black54),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(children: [
                      bulidButton('×', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      bulidButton('-', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      bulidButton('+', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      bulidButton('=', 2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
