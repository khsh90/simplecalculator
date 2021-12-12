import 'package:flutter/material.dart';
import '../provider/buttondata.dart';
import 'package:provider/provider.dart';
import '../widgets/bldbtn.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ButtonData>(context);

    providerData.result;
    providerData.expression;
    providerData.resultSize;
    providerData.expSize;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              providerData.expression,
              style: TextStyle(fontSize: providerData.expSize),
            ),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              providerData.result,
              style: TextStyle(fontSize: providerData.resultSize),
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
