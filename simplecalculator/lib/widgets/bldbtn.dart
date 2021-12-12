import 'package:flutter/material.dart';

class BldBtn extends StatelessWidget {
  final String btnName;
  final double btnSize;
  final Color btnBgColor;
  // final Function fn;

  BldBtn(this.btnName, this.btnSize, this.btnBgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: btnBgColor,
      height: MediaQuery.of(context).size.height * .10 * btnSize,
      child: FlatButton(
          onPressed: () => () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 1)),
          child: Text(btnName,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.normal))),
    );
  }
}
