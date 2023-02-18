import 'package:flutter/material.dart';
import 'package:mobilemart/extra/res/colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    this.color = grey,
    this.weight = FontWeight.bold,
    this.fontSize,
    this.overflow = TextOverflow.clip,
    this.buttontype,
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight weight;
  final double? fontSize;
  final TextOverflow overflow;
  final bool? buttontype;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: fontSize,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
