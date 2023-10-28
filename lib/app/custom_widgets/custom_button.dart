import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? buttonSize;
  final double? buttonHeight;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomButton({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.buttonSize,
    this.buttonHeight,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: buttonHeight ?? 40,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.buttonColor,
        border: Border.all(
          color: borderColor ?? AppColors.buttonColor,
        ),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          if (prefixIcon != null) const SizedBox(width: 10),
          Flexible(
            child: CustomText(
              text: buttonText,
              fontSize: buttonSize ?? 14,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (suffixIcon != null) const SizedBox(width: 10),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
