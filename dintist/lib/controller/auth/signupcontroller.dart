import 'package:dintist/class/Appcolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController{
  GlobalKey<FormState>stateform=GlobalKey<FormState>();
  TextEditingController? email;
  TextEditingController? pass;
 bool obccure=true;
 bool issignup=false;
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
  Signup(context)async{
    var formdata=stateform.currentState;
    if(formdata!.validate()){
      try {
         issignup=true;
         update();
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!.text,
          password: pass!.text,
        );
        Get.offNamed("/Login");
      } on FirebaseAuthException catch (e) {
        issignup=false;
        update();
        if (e.code == 'weak-password') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("كلمة السر ضعيفة جداً",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
        } else if (e.code == 'email-already-in-use') {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(title:Text("خطأ",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),) ,content: Text("الايميل موجود اختر ايميل أخر ",textAlign: TextAlign.center,style: TextStyle(color: Appcolors.primary_green)),);
          });
        }
      } catch (e) {
        print(e);
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