import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

bool isNumeric(String s) {
  if (s == ".") {
    return true;
  } else if (s == ",") {
    return true;
  } else if (s == null) {
    return false;
  }

  return double.parse(s, (e) => null) != null;
}

bool isInteger(num value) => value is int || value == value.roundToDouble();

String calculateValues(String valuesToCalc) {
  String numericValue = "";
  List<String> allNumericValuesAndOps = new List<String>();

  for (int i = 0; i < valuesToCalc.characters.length; i++) {
    if (isNumeric(valuesToCalc[i])) {
      numericValue += valuesToCalc[i];
      if (i == valuesToCalc.characters.length - 1) {
        allNumericValuesAndOps.add(numericValue);
      }
    } else {
      allNumericValuesAndOps.add(numericValue);
      allNumericValuesAndOps.add(valuesToCalc[i]);
      numericValue = "";
    }
  }

  if (allNumericValuesAndOps.contains("*") ||
      allNumericValuesAndOps.contains("/")) {
    for (int i = 0; i < allNumericValuesAndOps.length;i++) {
      String op = allNumericValuesAndOps[i];
      if (op == "*" || op == "/") {
        Decimal firstValue =
            Decimal.parse(allNumericValuesAndOps[i - 1].replaceAll(",", "."));
        Decimal secondValue =
            Decimal.parse(allNumericValuesAndOps[i + 1].replaceAll(",", "."));
        Decimal finalValue;
        switch (op) {
          case '*':
            finalValue = firstValue * secondValue;

            break;

          case '/':
            finalValue = firstValue / secondValue;

            break;
        }
        allNumericValuesAndOps.removeAt(i - 1);
        allNumericValuesAndOps.removeAt(i - 1);
        allNumericValuesAndOps[i - 1] = finalValue.toString();
      }
    }
  }
  
  if(allNumericValuesAndOps.length == 1)
  {
    if (allNumericValuesAndOps.length == 1) {
      if (isInteger(num.parse(allNumericValuesAndOps[0]))) {
        int intValue =
            int.parse(allNumericValuesAndOps[0].replaceAll(".0", ""));
        return intValue.toString();
      }
      return allNumericValuesAndOps[0];
    }
  }

  for (int i = 0; i < allNumericValuesAndOps.length; i = i + 2) {
    Decimal firstValue =
        Decimal.parse(allNumericValuesAndOps[i].replaceAll(",", "."));
    Decimal secondValue =
        Decimal.parse(allNumericValuesAndOps[i + 2].replaceAll(",", "."));

    String op = allNumericValuesAndOps[i + 1];

    switch (op) {
      case "+":
        allNumericValuesAndOps.removeAt(0);
        allNumericValuesAndOps.removeAt(1);
        allNumericValuesAndOps[0] = (firstValue + secondValue).toString();
        i = 0;
        break;
      case "*":
        allNumericValuesAndOps.removeAt(0);
        allNumericValuesAndOps.removeAt(1);
        allNumericValuesAndOps[0] = (firstValue + secondValue).toString();
        i = 0;
        break;
      case "-":
        allNumericValuesAndOps.removeAt(0);
        allNumericValuesAndOps.removeAt(1);
        allNumericValuesAndOps[0] = (firstValue - secondValue).toString();
        i = 0;
        break;
      case "/":
        allNumericValuesAndOps.removeAt(0);
        allNumericValuesAndOps.removeAt(1);
        allNumericValuesAndOps[0] = (firstValue / secondValue).toString();
        i = 0;
        break;
    }

    if (allNumericValuesAndOps.length == 1) {
      if (isInteger(num.parse(allNumericValuesAndOps[0]))) {
        int intValue =
            int.parse(allNumericValuesAndOps[0].replaceAll(".0", ""));
        return intValue.toString();
      }
      return allNumericValuesAndOps[0];
    }
  }
  return "0";
}
