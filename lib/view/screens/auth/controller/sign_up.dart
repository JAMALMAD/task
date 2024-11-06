
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task/core/app_routs.dart';
import 'package:task/utils/static_string/static_string.drat.dart';
import 'package:task/view/screens/auth/controller/auth_controller.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../widget/custom_bottom.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final AuthController authenticationController =
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),

              ///<===================== Title text =========================>

              const Center(
                  child: CustomText(
                    text: AppString.createAccount,
                    textAlign: TextAlign.center,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),

              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 44.h),
                          alignment: Alignment.center,
                          height: 100.r,
                          width: 100.r,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.light),
                          child: FlutterLogo(
                            size: 70.r,
                          ),
                        ),
                      ],
                    ),

                    ///<===================================Name section============================>
                    SizedBox(
                      height: 31.h,
                    ),

                    CustomText(
                      text: AppString.fullName,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                    ),

                    CustomTextField(
                      textEditingController:
                      authenticationController.fullNameController.value,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppString.fieldCantBeEmpty;
                        } else if (value.length < 4) {
                          return AppString.enterAValidName;
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      //   textEditingController: controller.fullNameSignUp,
                      hintText: AppString.fullName,
                    ),

                    ///<===========================Email section======================================>

                    CustomText(
                      text: AppString.email,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),
                    CustomTextField(
                      textEditingController:
                      authenticationController.signupEmailController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.enterValidEmail;
                        } else if (!AppString.emailRegexp.hasMatch(
                            authenticationController
                                .signupEmailController.value.text)) {
                          return AppString.enterValidEmail;
                        } else {
                          return null;
                        }
                      },

                      textInputAction: TextInputAction.next,
                      // textEditingController: controller.emailSignUp,
                      hintText: AppString.email,
                    ),

                    ///<=================================phone number section=============================>
                    CustomText(
                      text: AppString.phoneNumber,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController:
                      authenticationController.phoneNumberController.value,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppString.fieldCantBeEmpty;
                        } else if (value.length < 4) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      //textEditingController: controller.phoneSignUp,
                      textInputAction: TextInputAction.next,
                      hintText: AppString.phoneNumber,
                      keyboardType: TextInputType.phone,
                    ),

                    ///<==============================Password section====================================>
                    CustomText(
                      text: AppString.password,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController: authenticationController
                          .signupPasswordController.value,
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
                      textInputAction: TextInputAction.next,
                      //textEditingController: controller.passSignUp,
                      isPassword: true,
                      hintText: AppString.password,
                    ),

                    ///<==========================Confirm password========================================>
                    CustomText(
                      text: AppString.confirmPassword,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController: authenticationController
                          .confirmPasswordController.value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppString.fieldCantBeEmpty;
                        } else if (value !=
                            authenticationController
                                .signupPasswordController.value.text) {
                          return "Password should match";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      isPassword: true,
                      hintText: AppString.confirmPassword,
                    ),

                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),

              ///<==============================================Sign Up Button==========================================>
              CustomButton(
                fillColor: AppColors.redNormal,
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                  Get.toNamed(AppRouts.otpVerify);
                },
                title: AppString.signUp,
              ),

              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: AppString.alreadyHaveAnAccount,

                    /// <==============================Sign in text==============================>
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRouts.signIn);
                    },
                    child: const CustomText(
                      color: AppColors.blueNormal,
                      text: AppString.logIn,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
