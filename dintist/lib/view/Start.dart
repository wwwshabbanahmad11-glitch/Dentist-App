import 'package:dintist/class/Appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../controller/Startcontroller.dart';
import 'package:get/get.dart';
class Start extends GetView<Startcontroller>{
  Startcontroller startcontroller=Get.put(Startcontroller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
       padding: EdgeInsets.symmetric(vertical: 70.r),
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/12.jpg"))
        ),child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Image.asset("images/2.webp",width: 100.w,height: 100.h,),
            Text("ابتسامتك تهمنا",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold),)


          ],),
        Column(
          mainAxisSize: .min,
          children: [
            Text("د.حسن شعبان",style: TextStyle(color: Appcolors.gold,fontSize: 23.sp,fontWeight: FontWeight.bold),),
            Text(" طبيب أسنان",style: TextStyle(color: Appcolors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),)

          ],)
      ],),
      ),
    );
  }
}