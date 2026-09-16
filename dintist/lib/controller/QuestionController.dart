import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dintist/class/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Questioncontroller extends GetxController{

  TextEditingController? message;
  List Question=[];
Services services=Get.find();

Fuction_resd_message()async{

  await FirebaseFirestore.instance.collection("Users").doc(services.sharedPreferences!.getString("collection")!).collection("Question").orderBy("createdAt").snapshots().listen((event){
    Question.clear();
    event.docs.forEach((element){
      Question.add(element.data());
    });
    update();
  });
}


 ReplyDoctor()async{
    if(message!.text.isNotEmpty){
      Question.add({
        "id":"D",
        "message":message!.text,
        "createdAt": FieldValue.serverTimestamp(),
      });
      await FirebaseFirestore.instance.collection("Users").doc("${services.sharedPreferences!.getString(("collection"))}").set(
          {
            "email":services.sharedPreferences!.getString(("collection"))
          });
      await FirebaseFirestore.instance.collection("Users").doc(services.sharedPreferences!.getString("collection")!).collection("Question").add({
        "id":"D",
        "message":message!.text,
        "createdAt": FieldValue.serverTimestamp(),
      });
      message!.text="";
      update();

    }
    print(Question);
  }


  Function_sender()async{
  if(message!.text.isNotEmpty){
    Question.add({
      "id":"S",
      "message":message!.text,
      "createdAt": FieldValue.serverTimestamp(),
    });
    await FirebaseFirestore.instance.collection("Users").doc("${services.sharedPreferences!.getString(("collection"))}").set(
        {
          "email":services.sharedPreferences!.getString(("collection"))
        });
    await FirebaseFirestore.instance.collection("Users").doc(services.sharedPreferences!.getString("collection")!).collection("Question").add({
     "id":"S",
     "message":message!.text,
     "createdAt": FieldValue.serverTimestamp(),
    });
    message!.text="";
    update();

  }
print(Question);

  }

@override
  void onInit() {
   message=TextEditingController();
  // TODO: implement onInit
  // Fuction_read_response();
   Fuction_resd_message();
    super.onInit();
  }
  @override
  void dispose() {
  message!.dispose();
  // TODO: implement dispose
    super.dispose();
  }

}