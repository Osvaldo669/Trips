import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  double margin;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton(
      {Key? key,
      required this.color,
      required this.margin,
      this.icon,
      this.isIcon = false,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: isIcon == false
              ? Text(
                  text!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : Icon(
                  icon,
                  color: Colors.blue.shade600,
                )),
    );
  }
}
