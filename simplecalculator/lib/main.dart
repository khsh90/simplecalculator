import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';
import './widgets/bldbtn.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dandooneh Calculator',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String expression = '0';
  double expSize = 38;
  double resultSize = 48;

  clickedBtn(btnName) {
    setState(() {
      if (btnName == 'C') {
        expSize = 48;
        resultSize = 38;
        result = '0';
        expression = '0';
      }

      // -----------------------------------------------------------------

      else if (btnName == '⌫') {
        expSize = 38;
        resultSize = 48;

        expression = expression.substring(0, expression.length - 1);
        if (expression == '') {
          expression = '0';
        }
      }
      //-----------------------------------------------------------------------

      else if (btnName == '=') {
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
      }

      // ------------------------------

      else if (expression == '0') {
        expression = btnName;
      }
      //  -------------------------------
      else {
        expression = expression + btnName;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              expression,
              style: TextStyle(fontSize: expSize),
            ),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(fontSize: resultSize),
            ),
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          ),
          const Expanded(
              child: Divider(
            color: Colors.white,
          )),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      BldBtn('C', 1, Colors.redAccent),
                      BldBtn('⌫', 1, Colors.blue),
                      BldBtn('÷', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      BldBtn('1', 1, Colors.black45),
                      BldBtn('2', 1, Colors.black45),
                      BldBtn('3', 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      BldBtn('4', 1, Colors.black45),
                      BldBtn('5', 1, Colors.black45),
                      BldBtn('6', 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      BldBtn('7', 1, Colors.black45),
                      BldBtn('8', 1, Colors.black45),
                      BldBtn('9', 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      BldBtn('.', 1, Colors.black45),
                      BldBtn('0', 1, Colors.black45),
                      BldBtn('00', 1, Colors.black45),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      BldBtn('×', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      BldBtn('-', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      BldBtn('+', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      BldBtn('=', 2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
