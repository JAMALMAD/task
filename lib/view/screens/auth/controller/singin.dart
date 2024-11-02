
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task/view/screens/auth/controller/auth_controller.dart';
import 'package:task/view/widget/custom_text_field.dart';

import '../../../../utils/static_string/static_string.drat.dart';
import '../../../widget/custom_text.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();


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
                SizedBox(height: 64.h),
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

                ///============= Form =============

                Form(
                  key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                            text: AppString.email,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          bottom: 16.h,
                          top: 30.h,
                        ),

                        /// <=============== Email Section ==================>


                        CustomTextField(
                          textEditingController:
                              authController.emailController.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.enterValidEmail;
                            } else if (!AppString.emailRegexp.hasMatch(
                                authController.emailController.value.text)) {
                              return AppString.enterValidEmail;
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          // textEditingController: controller.signInEmail,
                          hintText: AppString.enterYourEmail,
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}