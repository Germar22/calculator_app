import 'package:flutter/cupertino.dart';
import 'package:flutter_toast_bar/flutter_toast_bar.dart';

class Operation{
  void calculate(BuildContext context,String math,double num1, double num2) {
    switch(math){
      case 'add':
        FlutterToastBar.showToast(
            context: context,
            message: "${num1 + num2}");
        break;
      case 'subtract':
        FlutterToastBar.showToast(
            context: context,
            message: "${num1 - num2}");
        break;
      case 'multiply':
        FlutterToastBar.showToast(
            context: context,
            message: "${num1 * num2}");
        break;
      case 'divide':
        FlutterToastBar.showToast(
            context: context,
            message: "${num1 / num2}");
        break;
      default:
        FlutterToastBar.showToast(
            context: context,
            message: "Please select an operation first!");
    }

  }
}