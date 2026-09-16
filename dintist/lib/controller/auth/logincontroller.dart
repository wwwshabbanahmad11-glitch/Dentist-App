import 'dart:convert';
import 'dart:developer';

import 'package:dintist/class/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../class/Appcolors.dart';
import '../../class/Sqlfite.dart';

class Logincontroller extends GetxController{
  GlobalKey<FormState>stateform1=GlobalKey<FormState>();
  TextEditingController? email;
  TextEditingController? pass;
  bool obccure=true;
  bool isslogin=false;
  Services service=Get.find();
  SqlDb sqlDb=SqlDb();
  readjson()async{
    try{
      String json_data=await rootBundle.loadString("data_servce_datils/data.json");
      List data=jsonDecode(json_data);
      for(Map d in data){
        await sqlDb.insertDB("Service_ditails", {
          "title":d["title"],
          "image":d["image"],
          "price":d["price"],
          "description":d["description"],
          "features":jsonEncode(d["features"]),
        });
      }
      print("111111");
      String articaljson=await rootBundle.loadString("data_servce_datils/artical.json");
      List arti=jsonDecode(articaljson);
      print(arti);
      for(Map a in arti){
        await sqlDb.insertDB("Artical", {
          "title":a["title"],
          "cat": a["cat"],
          "category":a["category"],
          "image":a["image"],
          "description":a["description"],
          "content":a["content"],
        });

      }

      print("load data succ");
    }catch(e){
      print("error load data");
    }
  }


  change_showpass(){
    obccure=!obccure;
    update();
  }

  validator_email(val){
    if(!GetUtils.isEmail(val)){
      return "aaa@bb.com  صيغة الايميل غير صحيحة مثال ";
    }

  }
  validator_pass(val){
    if(val.length<8){
      return "كلمة السر يجب ان تكون 8 محارف على الاقل";
    }
    if(!RegExp(r'[A-Z]').hasMatch(val)){
      return "كلمة السر يجب أن تحتوي احرف كبيرة";
    }
    if(!RegExp(r'[0-9]').hasMatch(val)){
      return "كلمة السر يجب أن تحتوي أرقام";
    }

  }

  login(context)async{
    var formdata=stateform1.currentState;
    if(formdata!.validate()){
      try {
        isslogin=true;
        update();
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email!.text,
            password: pass!.text
        );
        service.sharedPreferences!.setString("collection",email!.text);
        service.sharedPreferences!.setString("page","1");
        readjson();
        Get.offAllNamed("/Appscreen");

      } on FirebaseAuthException catch (e) {

        isslogin=false;
        update();
        if (e.code == 'invalid-credential') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("البريد الإلكتروني أو كلمة المرور غير صحيحة",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
          print('البريد الإلكتروني أو كلمة المرور غير صحيحة');
        } else if (e.code == 'invalid-email') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("صيغة البريد الإلكتروني غير صحيحة",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
          print('صيغة البريد الإلكتروني غير صحيحة'); }
        else if (e.code == 'user-disabled') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("هذا الحساب معطل",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
          print('هذا الحساب معطل'); }
        else if (e.code == 'too-many-requests') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("محاولات كثيرة، حاول لاحقا",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
          print('محاولات كثيرة، حاول لاحقاً'); }
        else { print('حدث خطأ أثناء تسجيل الدخول'); }
      }
    }else{
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("تأكد من ادخال الحقول بصيغة صحيحية ",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
      });
    }


  }





@override
  void onInit() {
  email =TextEditingController();
  pass=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

@override
  void dispose() {
    email!.dispose();
  pass!.dispose();
    // TODO: implement dispose
    super.dispose();
  }








}