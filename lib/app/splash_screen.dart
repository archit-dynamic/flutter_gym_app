import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/routes/routes.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.preferences, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: const Center(
        child: CustomText(text: "Splash Screen"),
      ),
    );
  }
}
