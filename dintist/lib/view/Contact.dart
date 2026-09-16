import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../controller/ContactController.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Get.put(Contactcontroller());
    // TODO: implement build
    return GetBuilder<Contactcontroller>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Get.offAllNamed("/Profile");
            }, icon: Icon(Icons.arrow_back)),
            title: Text("جهات الاتصال",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),centerTitle: true,),
          body:controller.emails.isEmpty? Center(child: CircularProgressIndicator()):
           Container(
                margin: EdgeInsets.all(10.r),
                child: ListView(children: [
                ...List.generate(controller.emails.length, (i){
                  return InkWell(
                    onTap: (){
                      controller.gotiRepley(controller.emails[i]);
                    },
                    child: Card(
                      color: Colors.white60 ,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        padding: EdgeInsets.symmetric(horizontal: 7.r,vertical: 7.r),
                        decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(10.r)),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("${controller.emails[i].split('@')[0].trim()}",style: TextStyle(color: Appcolors.secound_green,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                          CircleAvatar(child: Icon(Icons.person,size: 40,),radius: 30.r,),

                        ],) ,),
                    ),
                  );
                })
              ],),)


        );
      }
    );
  }
}