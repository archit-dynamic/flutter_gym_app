import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_button.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text_field.dart';
import 'package:flutter_gym_app/app/providers/sign_up_provider.dart';
import 'package:flutter_gym_app/app/routes/routes.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String birthDate = "";
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpProvider(),
      child: Builder(
        builder: (context) {
          final provider = context.watch<SignUpProvider>();
          return Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const CustomText(
                    text: "SignUp",
                    color: AppColors.themeColor,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: firstNameController,
                          hintText: "First Name",
                          label: "First Name",
                          hintColor: AppColors.hintColor,
                          hintSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: lastNameController,
                          hintText: "Last Name",
                          label: "Last Name",
                          hintColor: AppColors.hintColor,
                          hintSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
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
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        birthDate = Jiffy.parseFromDateTime(pickedDate)
                            .format(pattern: 'MMM do yy');
                        debugPrint(
                            "picked date ${Jiffy.parseFromDateTime(pickedDate).format(pattern: 'MMM do yy')}");
                      }
                    },
                    showCursor: false,
                    hintText: "Birth Date",
                    label: "Birth Date",
                    hintColor: AppColors.hintColor,
                    hintSize: 14,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Gender",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Material(
                        child: DropdownButton(
                            isExpanded: true,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hint: const CustomText(
                              text: "Select Gender",
                              fontSize: 14,
                              color: AppColors.hintColor,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "Male",
                                onTap: () {},
                                child: const CustomText(
                                  text: "Male",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Female",
                                onTap: () {},
                                child: const CustomText(
                                  text: "Female",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              gender = value ?? "";
                            }),
                      ),
                    ],
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
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CustomTextField(
                    hintText: "Confirm Password",
                    label: "Confirm Password",
                    hintColor: AppColors.hintColor,
                    hintSize: 14,
                    obscureText: true,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () async {
                      User? user = await provider.signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          birthDate: birthDate,
                          firstName: firstNameController.text,
                          gender: gender,
                          lastName: lastNameController.text);
                      debugPrint("Signup ontap user = $user");
                      if (user != null) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.login, (route) => false);
                      }
                    },
                    child: const CustomButton(
                      buttonText: "SignUp",
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
                        text: "Already Registered? ",
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.login, (route) => false);
                        },
                        child: const CustomText(
                          text: "Login",
                          fontSize: 16,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
