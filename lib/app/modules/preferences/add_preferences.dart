import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_button.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text.dart';
import 'package:flutter_gym_app/app/custom_widgets/custom_text_field.dart';
import 'package:flutter_gym_app/app/providers/preferences_provider.dart';
import 'package:flutter_gym_app/app/utils/colors/app_colors.dart';
import 'package:flutter_gym_app/app/utils/enums.dart';
import 'package:provider/provider.dart';

class AddPreferences extends StatelessWidget {
  const AddPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PreferencesProvider(),
      child: Builder(builder: (context) {
        final provider = context.watch<PreferencesProvider>();
        return Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const CustomText(
                text: "Step 1 of 3",
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                height: 32,
              ),
              if (provider.preference == Preference.metric)
                Expanded(
                  child: Material(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: "Please select  your preferred unit system:",
                          fontSize: 24,
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: const CustomText(
                            text: "Imperial (lbs, inches, feet, miles)",
                            maxLines: 2,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          leading: Radio(
                            value: "1",
                            groupValue: "2",
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: const CustomText(
                            text: "Metric (kg, cm, km)",
                            maxLines: 2,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          leading: Radio(
                            value: "2",
                            groupValue: "2",
                            onChanged: (value) {},
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            provider.setPreference(Preference.height);
                          },
                          child: const CustomButton(
                            buttonText: "Next",
                            buttonSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              if (provider.preference == Preference.height)
                Expanded(
                  child: Material(
                    child: Column(
                      children: [
                        const CustomText(
                          text: "How tall are you?",
                          fontSize: 24,
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: CustomTextField(
                                hintText: "Height",
                                label: "Height",
                                maxLines: 1,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true, signed: false),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: DropdownButton(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  value: "cm",
                                  items: [
                                    DropdownMenuItem(
                                      value: "cm",
                                      onTap: () {},
                                      child: const CustomText(
                                        text: "cm",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "m",
                                      onTap: () {},
                                      child: const CustomText(
                                        text: "m",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "in",
                                      onTap: () {},
                                      child: const CustomText(
                                        text: "in",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "ft",
                                      onTap: () {},
                                      child: const CustomText(
                                        text: "ft",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                  onChanged: (value) {}),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            provider.setPreference(Preference.metric);
                          },
                          child: const CustomButton(
                            buttonText: "Next",
                            buttonSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
