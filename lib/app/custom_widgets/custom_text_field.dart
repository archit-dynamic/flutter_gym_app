import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';
import 'package:flutter_gym_app/app/utils/decorators/input_borders.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final double? labelSize;
  final Color? labelColor;
  final TextEditingController? controller;
  final int? maxLines;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final FontStyle? textFontStyle;
  final String? textFamily;
  final String? hintText;
  final Color? hintColor;
  final double? hintSize;
  final String? fontFamily;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool autofocus;
  final Color? cursorColor;
  final bool enabled;
  final FocusNode? focusNode;
  final bool showCursor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final int? minLines;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.label,
    this.labelSize,
    this.labelColor,
    this.controller,
    this.maxLines,
    this.textStyle,
    this.onTap,
    this.readOnly = false,
    this.textColor,
    this.textSize,
    this.textFontStyle,
    this.textWeight,
    this.textFamily,
    this.hintText,
    this.hintColor = AppColors.hintColor,
    this.hintSize,
    this.fontFamily,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.cursorColor = AppColors.black,
    this.enabled = true,
    this.focusNode,
    this.showCursor = true,
    this.inputFormatters,
    this.maxLength,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.minLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            CustomText(
              text: label,
              fontSize: labelSize,
              color: labelColor,
            ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: textWeight,
              fontStyle: textFontStyle,
              fontFamily: textFamily,
              height: 14 / 12,
            ),
            onTap: onTap,
            readOnly: readOnly,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor,
                fontSize: hintSize,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontFamily: fontFamily,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: prefixIconColor,
              suffixIconColor: suffixIconColor,
              fillColor: fillColor,
              disabledBorder: InputBorders.disabledBorder,
              border: InputBorders.border,
              enabledBorder: InputBorders.enabledBorder,
              errorBorder: InputBorders.errorBorder,
              focusedBorder: InputBorders.focusedBorder,
              focusedErrorBorder: InputBorders.focusedErrorBorder,
            ),
            keyboardType: keyboardType,
            textAlign: textAlign,
            autofocus: autofocus,
            cursorColor: cursorColor,
            enabled: enabled,
            focusNode: focusNode,
            showCursor: showCursor,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            obscureText: obscureText,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onTapOutside: onTapOutside,
            minLines: minLines,
          ),
        ],
      ),
    );
  }
}
