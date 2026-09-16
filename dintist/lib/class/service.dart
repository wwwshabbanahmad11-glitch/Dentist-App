import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService{
SharedPreferences? sharedPreferences;
Future<Services> inti()async{
  sharedPreferences=await SharedPreferences.getInstance();
 // CollectionReference appiontment=await FirebaseFirestore.instance.collection("Appionment");
  String? token=await FirebaseMessaging.instance.getToken();
  print(token);
 return this;
}

}

intial_service()async{
 await Get.putAsync(()=>Services().inti());
}