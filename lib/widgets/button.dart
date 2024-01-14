import 'package:flutter/material.dart';
import '../main.dart';

class CustomButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final double textSize;
  final EdgeInsetsGeometry padding;
  final double elevation;
  const CustomButton({super.key, required this.onClick, required this.text, this.textSize = 16.0, this.padding = const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0), this.elevation = 2.0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: padding ,
          backgroundColor:  Theme.of(context).extension<AppColors>()?.primaryColor
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).extension<AppColors>()?.lightColor,
          fontSize: textSize,
        ),
      ),
    );
  }

}