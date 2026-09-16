import 'package:dintist/view/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../controller/Appcreen_controller.dart';
import 'Help.dart';
import 'Home.dart';
import 'artical.dart';

class Appscreen extends GetView<AppcreenController>{
  @override
  Widget build(BuildContext context) {
    Get.put(AppcreenController());
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white.withOpacity(0),
        height: 70.h,
        padding: EdgeInsets.all(1.r),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/14.png"))
          ),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
          children: [
            Opacity(
              opacity: 0.6,
              child: Column(
                mainAxisSize: .min,
                children: [
                  IconButton(onPressed: (){ Get.toNamed("/Profile");}, icon: Icon(Icons.person_outline_sharp,color: Colors.white,size: 35,)),
                  Text("دكتور ",style: TextStyle(color: Appcolors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                ],),

            ),

            Opacity(
              opacity: 0.6,
              child: Column(
                mainAxisSize: .min,
                children: [
                  IconButton(onPressed: (){
                    Get.toNamed("/Help");
                  }, icon: Icon(Icons.note_add_outlined,color: Colors.white,size: 35,)),
                  Text("الخدمات",style: TextStyle(color: Appcolors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                ],),
            ),
            Opacity(
              opacity: 0.6,
              child: Column(
                mainAxisSize: .min,
                children: [
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.settings,color: Colors.white,size: 35,)),
                  Text("الاعدادات",style: TextStyle(color: Appcolors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                ],),
            ),

          ],),
        ),),
      body: PageView(

        controller:controller.pageController ,
        children: [
          Home(),
          Help(),
          Profile(),
          Artical(),


    ],),);
  }
}