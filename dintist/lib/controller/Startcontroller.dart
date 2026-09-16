import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../class/Sqlfite.dart';
import '../class/service.dart';

class Startcontroller extends GetxController{
  Services service=Get.find();


GotoHome()async{
  await Future.delayed(Duration(seconds: 2)) ;
 if(service.sharedPreferences!.getString("page")=="1"){
   Get.offAllNamed("/Appscreen",);
 }  else{
   Get.offAllNamed("/Login",);
 }


}


@override
  void onInit() {
  GotoHome();
    // TODO: implement onInit
    super.onInit();
  }







}