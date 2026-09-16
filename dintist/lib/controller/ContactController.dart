import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dintist/class/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Contactcontroller extends GetxController{
Services services=Get.find();
 List emails=[];
 List<Map> users=[];
 List<Map> Allusers=[];
 fetchAllUsers() async {
 CollectionReference reference=FirebaseFirestore.instance.collection("Users");
 await reference.get().then((val){
   val.docs.forEach((element){
     emails.add(element.id);
     update();
   });
   update();
   print(emails);
 });
}
gotiRepley(String em){
   Get.toNamed("/Replydoctor",arguments: {
     "email":em
   });
}


@override
  void onInit()async {
  fetchAllUsers();
  //ddd();
    // TODO: implement onInit
    super.onInit();
  }
}