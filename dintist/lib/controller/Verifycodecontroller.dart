import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verifycodecontroller extends GetxController{


  TextEditingController? code;


  verifycode(BuildContext context){
    if(code!.text=="44444444"){
      Get.offAllNamed("/Contact");
    }else{
      showDialog(context: context, builder: (context){
        return AlertDialog(title: Text("الكود غير صحيح"),content: Text("أدخل الكود الصحيح"),);
      });
    }

  }



  @override
  void onInit() {
    code=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    code!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}