import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../class/service.dart';

class Replycontroller extends GetxController{

  String? email;

  TextEditingController? message;
  List Question=[];

  Services services=Get.find();

  Fuction_resd_message()async{

    await FirebaseFirestore.instance.collection("Users").doc(email).collection("Question").orderBy("createdAt").snapshots().listen((event){
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
      await FirebaseFirestore.instance.collection("Users").doc(email).set(
          {
            "email":email
          });
      await FirebaseFirestore.instance.collection("Users").doc(email).collection("Question").add({
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
      await FirebaseFirestore.instance.collection("Users").doc(email).set(
          {
            "email":email
          });
      await FirebaseFirestore.instance.collection("Users").doc(email).collection("Question").add({
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
    email=Get.arguments["email"];
    message=TextEditingController();
    // TODO: implement onInit
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