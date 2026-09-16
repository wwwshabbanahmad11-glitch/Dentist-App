import 'package:dintist/class/service.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController{
Services services=Get.find();
  logout(){
  services.sharedPreferences!.remove("collection");
  services.sharedPreferences!.remove("page");
 Get.offAllNamed("/Login");
  }
  gotoAppointments(){
    Get.toNamed("/Appointments");
  }
  gotohelps(){
    Get.toNamed("/Help");
  }
}