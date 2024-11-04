
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task/utils/static_string/static_string.drat.dart';
import 'package:task/view/screens/auth/controller/auth_controller.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../widget/custom_bottom.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final AuthController authenticationController =
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  const CustomText(
                    text: AppString.welcomeBack,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    bottom: 20,
                  ),

                  const CustomText(
                    text: AppString.pleaseEnterYour,
                    maxLines: 3,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    bottom: 10,
                  ),
                  const Divider(),

                  ///============================= Form ============================
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppString.email,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            bottom: 16.h,
                            top: 30.h,
                          ),

                          ///<======================== Email section =========================>

                          CustomTextField(
                            textEditingController:
                            authenticationController.emailController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.enterValidEmail;
                              } else if (!AppString.emailRegexp.hasMatch(
                                  authenticationController
                                      .emailController.value.text)) {
                                return AppString.enterValidEmail;
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            // textEditingController: controller.signInEmail,
                            hintText: AppString.enterYourEmail,
                          ),

                          ///<====================== Password section =======================>

                          CustomText(
                            text: AppString.password,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            top: 16.h,
                            bottom: 16.h,
                          ),
                          CustomTextField(
                            textEditingController:
                            authenticationController.passwordController.value,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.passWordMustBeAtLeast;
                              } else if (value.length < 8 ||
                                  !AppString.passRegexp.hasMatch(value)) {
                                return AppString.passwordLengthAndContain;
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            isPassword: true,
                            hintText: AppString.enterYourPassword,
                          ),
                        ],
                      )),

                  ///<============================== Login Button ====================================>

                  SizedBox(
                    height: 45.h,
                  ),
                  CustomButton(
                    fillColor: AppColors.redNormal,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {}
                    },
                    title: AppString.logIn,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: const Divider(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: AppString.dontHaveAnyAccount),

                      ///========================= Sign Up Button ========================
                      TextButton(
                          onPressed: () {},
                          child: const CustomText(
                              color: AppColors.blueNormal,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              text: AppString.signUp))
                    ],
                  )
                ],
              ),
            )
        );
      }
      ),
    );
  }
}
