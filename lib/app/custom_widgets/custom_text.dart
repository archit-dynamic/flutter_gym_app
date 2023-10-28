import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    this.text,
    this.color = AppColors.black,
    this.fontFamily,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: TextDecoration.none,
      ),
    );
  }
}
