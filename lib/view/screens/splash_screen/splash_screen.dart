
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/core/app_routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(AppRouts.signIn);
    });
  }

 @override
  void initState() {
  navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FlutterLogo(
            size: 150.r,
            ),
            SizedBox(height: 100.h,)
          ],
        ),
      ),
    );
  }
}
