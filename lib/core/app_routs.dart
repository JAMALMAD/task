import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/view/screens/splash_screen/splash_screen.dart';

class AppRouts{
  static const String splashscreen = "/splashscreen";
  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: ()=>SplashScreen()),
  ];
}