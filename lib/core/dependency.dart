import 'package:get/get.dart';
import 'package:task/view/screens/auth/controller/auth_controller.dart';


class DependencyInjection extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
  
}