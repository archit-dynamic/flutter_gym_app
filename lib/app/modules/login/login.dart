import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_button.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text_field.dart';
import 'package:flutter_gym_app/app/providers/login_provider.dart';
import 'package:flutter_gym_app/app/routes/routes.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';
import 'package:flutter_gym_app/app/utils/enums.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Builder(builder: (context) {
        final provider = context.watch<LoginProvider>();
        if (provider.authenticationState == AuthenticationState.unauthorized) {
          return Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                const CustomText(
                  text: "Login",
                  color: AppColors.themeColor,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  label: "Email",
                  hintColor: AppColors.hintColor,
                  hintSize: 14,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  label: "Password",
                  hintColor: AppColors.hintColor,
                  hintSize: 14,
                  obscureText: true,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Forgot Password?",
                      fontSize: 16,
                      color: AppColors.themeColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    provider.login(
                        emailController.text, passwordController.text);
                    /*Navigator.pushNamedAndRemoveUntil(
                        context, Routes.home, (route) => false);*/
                  },
                  child: const CustomButton(
                    buttonText: "Login",
                    buttonSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Not Registered? ",
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.signUp, (route) => false);
                      },
                      child: const CustomText(
                        text: "Signup",
                        fontSize: 16,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (provider.authenticationState ==
            AuthenticationState.authenticating) {
          return Container(
            color: AppColors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
          return Container();
        }
      }),
    );
  }
}
