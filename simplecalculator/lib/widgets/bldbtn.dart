import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/buttondata.dart';

class BldBtn extends StatelessWidget {
  final String btnName;
  final double btnSize;
  final Color btnBgColor;

  BldBtn(this.btnName, this.btnSize, this.btnBgColor);

  @override
  Widget build(BuildContext context) {
    final btnProvider = Provider.of<ButtonData>(context);

    return Container(
        color: btnBgColor,
        height: MediaQuery.of(context).size.height * .10 * btnSize,
        child: TextButton(
            onPressed: () => btnProvider.clickedBtn(btnName),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(
                      color: Colors.white, style: BorderStyle.solid, width: 1)),
            ),
            child: Text(btnName,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.normal))));
  }
}
