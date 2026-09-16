import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../controller/Helpsdetailscontroller.dart';

class HelpDatails extends GetView<Helpsdetailscontroller>{
  @override
  Widget build(BuildContext context) {
    Get.put(Helpsdetailscontroller());
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white.withOpacity(0),
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal:10.r),
          child: InkWell(
            onTap: (){
              Get.toNamed("/BookAnAppointment",arguments: {
                "name_help":controller.help_data
              });
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/14.png"))
                ),child:Text("احجز الآن",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.r),)
            ),
          ),),
        appBar: AppBar(title: Text("تفاصيل الخدمة",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),centerTitle: true,),
       body:FutureBuilder(
         future: controller.Fetshdata(),
         builder: (BuildContext context,snapshot) {
           if(!snapshot.hasData){
             return Center(child: CircularProgressIndicator(),);
           }else{
           return Container(
             width: 1.sw,
             height: 1.sh,
             margin: EdgeInsets.symmetric(horizontal:15.r),
             child: Column(children: [
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.r),
                 ),
                 child: Container(height: 230.r,width:1.sw,decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20.r),
                   image: DecorationImage(
                       fit: BoxFit.fill,
                       image:AssetImage("images/${controller.help_data!["image"]}"))
                 ),),
               ),
            Text("${controller.help_data!["title"]}",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),
            Text("${controller.help_data!["price"]}",style: TextStyle(color: Colors.grey,fontSize: 17.sp,fontWeight: FontWeight.bold)),
           SizedBox(height: 10.h,),
            Container(width: 1.sw,
              child: Text("${controller.help_data!["description"]}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),),
               SizedBox(height: 20.h,),
               Flexible(
                 fit: FlexFit.tight,
                 child: Column(children: [
                   Row(
                     children: [
                     Icon(Icons.check,color: Colors.green,size: 30,),
                     SizedBox(width: 10.w,),
                      Text("${jsonDecode(controller.help_data!["features"])[0]}",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),
                   ],),
                   SizedBox(height: 5.h,),
                   Row(
                     children: [
                       Icon(Icons.check,color: Colors.green,size: 30,),
                       SizedBox(width: 10.w,),
                       Text("${jsonDecode(controller.help_data!["features"])[1]}",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),
                     ],),
                   SizedBox(height: 5.h,),
                   Row(
                     children: [
                       Icon(Icons.check,color: Colors.green,size: 30,),
                       SizedBox(width: 10.w,),
                       Text("${jsonDecode(controller.help_data!["features"])[2]}",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),
                     ],),
                   SizedBox(height: 5.h,),
                   Row(
                     children: [
                       Icon(Icons.check,color: Colors.green,size: 30,),
                       SizedBox(width: 10.w,),
                       Text("${jsonDecode(controller.help_data!["features"])[3]}",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),
                     ],),
                   SizedBox(height: 5.h,),
                   Row(
                     children: [
                       Icon(Icons.check,color: Colors.green,size: 30,),
                       SizedBox(width: 10.w,),
                       Text("${jsonDecode(controller.help_data!["features"])[4]}",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold)),
                     ],),
                 ],))
             ],),
           );}
         }
       ) ,
      ),
    );

  }
}