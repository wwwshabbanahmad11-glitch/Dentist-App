import 'package:dintist/controller/Verifycodecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';

class Verify extends GetView<Verifycodecontroller>{
  Verifycodecontroller verifycodecontroller=Get.put(Verifycodecontroller());

  Verify({super.key});
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("الدكتور",style: TextStyle(color: Appcolors.primary_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5.r),
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("مرجيا دكتور الرجاء ادخال كود التحقق من الشخصية",style: TextStyle(color: Appcolors.gold,fontSize: 15.sp,fontWeight: FontWeight.bold)),
            SizedBox(height: 20.r,),
            TextFormField(
              maxLength: 8,
              controller: controller.code,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.code),
                  label: Text("كود التحقق"),
                  border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10.r)
            )),) ,
            SizedBox(height: 10.r,),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 40.r,vertical: 5.r),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              onPressed: (){
              controller.verifycode(context);
            },child: Text("تم",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)),)
              
            
            
          ],),
        ),
      ),
    );
  }
  
}