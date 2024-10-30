
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../utils/static_string/static_string.drat.dart';
import '../../../widget/custom_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            ],
          ),
        ),
      ),
    );
  }
}