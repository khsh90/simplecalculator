import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonData with ChangeNotifier {
  String result = '0';
  String expression = '0';
  double expSize = 38;
  double resultSize = 48;

  clickedBtn(String btnName) {
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
    notifyListeners();
  }

  //- -----------------

}
