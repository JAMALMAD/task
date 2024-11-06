import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/screens/auth/controller/otp_verify.dart';
import '../view/screens/auth/controller/singin.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class AppRouts {
  static const String splashscreen = "/splashscreen";
  static const String signIn = "/signIn";
  static const String otpVerify = "/otpVerify";
  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => SplashScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: otpVerify, page: () =>  OtpVerify()),
  ];
}
