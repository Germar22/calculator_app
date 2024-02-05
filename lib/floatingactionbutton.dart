import 'package:flutter/material.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Icon icon;

  const FloatingActionButtonCustom({super.key, required this.title, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: onPressed,
      tooltip: title,
      child: icon,
    );
  }
}
