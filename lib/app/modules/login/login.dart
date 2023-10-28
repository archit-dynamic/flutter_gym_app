import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_button.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text_field.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: "Enter Username",
            label: "Username",
            hintColor: AppColors.hintColor,
            hintSize: 14,
          ),
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: "Enter Password",
            label: "Password",
            hintColor: AppColors.hintColor,
            hintSize: 14,
            obscureText: true,
            maxLines: 1,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
            buttonText: "Login",
            buttonSize: 16,
          ),
        ],
      ),
    );
  }
}
