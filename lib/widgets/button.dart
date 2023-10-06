import 'package:flutter/material.dart';

class TmButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? buttonColor;
  final Color? titleStyle;
  final Radius? borderRadius;
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  const TmButton({Key? key, this.buttonTitle, this.buttonColor, required this.onPressed, this.titleStyle, this.borderRadius, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(borderRadius!),
            color: buttonColor
          ),
          child: Text(buttonTitle!, style: TextStyle(color: titleStyle),),
        ));
  }
}
