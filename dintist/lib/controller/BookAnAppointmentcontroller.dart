
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../class/service.dart';

class Bookanappointmentcontroller extends GetxController{
  Services service=Get.find();
 bool issure=false;
  Map? help_details;
  TextEditingController? note;
  List<int> hour=[
    09, 10, 11, 12, 13, 14, 15, 16,
  ];
  int? i_container;
  String? dateTime;
  DateTime? date;
  colorcontainer(i){
    i_container=i;
    update();
  }

  void SelectedDay(d1){
    date =d1;
    dateTime=Jiffy.parseFromDateTime(d1).format(pattern: "dd/MM/yyyy");
    print(dateTime);
    update();
  }
  Save_Appointment(BuildContext context)async{
    if(i_container==null || dateTime==null){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("تنبية",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
          content: Text("يجب عليك ادخال التاريخ والوقت",style: TextStyle(color: Colors.green),textAlign: TextAlign.center,),);
      });
    }else{
      try{
        issure=true;
        update();
        await FirebaseFirestore.instance.collection("Users").doc("${service.sharedPreferences!.getString(("collection"))}").set(
            {
              "email":service.sharedPreferences!.getString(("collection"))
            });
        CollectionReference reference=await FirebaseFirestore.instance.collection("Users").doc("${service.sharedPreferences!.getString(("collection"))}").collection("Appointment");
        reference.add({
          "name_helps":help_details!["title"],
          "date":dateTime,
          "Time":"${hour[i_container!]}:00",
          "note(optianal)":note!.text.isEmpty?"لا يوجد":note!.text
        });
        Get.offAllNamed("/Appscreen");
      }
      catch(e){
        issure=false;
        update();
        print("error"*90);
      }

    }


  }
@override
  void onInit() {
    note=TextEditingController();
    help_details=Get.arguments["name_help"];
    // TODO: implement onInit
    super.onInit();
  }


  @override
  void dispose() {
    note?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

}