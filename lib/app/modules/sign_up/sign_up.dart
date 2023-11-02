import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_button.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text_field.dart';
import 'package:flutter_gym_app/app/routes/routes.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';
import 'package:jiffy/jiffy.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "First Name",
                    label: "First Name",
                    hintColor: AppColors.hintColor,
                    hintSize: 14,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomTextField(
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
            const CustomTextField(
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
                      onChanged: (value) {}),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomTextField(
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
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
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
  }
}
