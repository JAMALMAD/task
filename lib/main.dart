import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/core/app_routs.dart';
import 'package:task/global/theme/dark_theme.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_,child){
        return GetMaterialApp(
         theme: darkModeTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppRouts.routes,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 200),
          navigatorKey: Get.key,
          initialRoute: AppRouts.splashscreen,
        );
      },
    );
  }
}

