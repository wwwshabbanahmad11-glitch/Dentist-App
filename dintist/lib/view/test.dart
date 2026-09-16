import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../controller/ContactController.dart';
class Test extends GetView<Contactcontroller>{
  String email = "ahmed@gmail.com";
  @override
  Widget build(BuildContext context) {
    Get.put(Contactcontroller());
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        IconButton(onPressed: ()async{
        controller.fetchAllUsers();


        }, icon: Icon(Icons.person)),






      ],),
    );
  }
}