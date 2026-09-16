import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../class/Appcolors.dart';
import 'package:get/get.dart';
class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("الدكتور",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),),
        body: SingleChildScrollView(
          child: Container(width: 1.sw,height: 1.sh,margin: EdgeInsets.symmetric(horizontal: 10.r),child: Column(children: [
            InkWell(
                onLongPress: (){
                  Get.toNamed("/Verify");
                },
                child: CircleAvatar(radius: 80.r,backgroundImage: AssetImage("images/hasan.png"),)),
            Text("د.حسن شعبان",style: TextStyle(color: Colors.black,fontSize: 23.sp,fontWeight: FontWeight.bold),),
            Text(" طبيب أسنان",style: TextStyle(color: Colors.black54,fontSize: 15.sp,fontWeight: FontWeight.bold),),
           SizedBox(height: 7.r,),
            Text(" أقدم خدمات طب الأسنان بأحدث اتقنيات لضمان صحة\n فمك وايتسامة جميلة تدوم طويلاً",textAlign: TextAlign.center,style: TextStyle(color: Colors.black54,fontSize: 15.sp,fontWeight: FontWeight.bold),),
          
           Container(margin: EdgeInsets.only(top: 10.r),padding: EdgeInsets.only(right: 60.r),width: 1.sw,height: 80.h,decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.r),
             image: DecorationImage(
                 fit: BoxFit.fill,
                 image: AssetImage("images/14.png"))
           ),child: Row(children: [
          Padding(
           padding: EdgeInsets.only(left: 20.r)  ,
              child: Icon(Icons.phone_in_talk_outlined,size: 30,color: Colors.white,)),
             Expanded(
               flex: 2,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Text("اتصل بنا",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                 Text(" 0934364616",style: TextStyle(color: Colors.white,fontSize: 17.sp,fontWeight: FontWeight.bold),),
               ],),
             )
           ],),),
            Container(margin: EdgeInsets.only(top: 10.r),padding: EdgeInsets.only(right: 60.r),width: 1.sw,height: 80.h,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.green)
            ),child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 20.r)  ,
                  child: Icon(Icons.location_on,size: 40,color: Appcolors.primary_green,)),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("عنوان العيادة",style: TextStyle(color: Colors.black54,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                    Text("القرداحة -المول-الطابق الأخير",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                  ],),
              )
            ],),),
            Container(margin: EdgeInsets.only(top: 10.r),padding: EdgeInsets.only(right: 60.r),width: 1.sw,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.green)
            ),child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 20.r)  ,
                  child: Icon(Icons.watch_later_outlined,size: 40,color: Appcolors.primary_green,)),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ساعات العمل",style: TextStyle(color: Colors.black54,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                    Text(" الأحد _ الخميس",style: TextStyle(color: Colors.black54,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                    Text("  09:00 ص _  17:00 م",style: TextStyle(color: Colors.black54,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                    Text(" الجمعة:إجازة ",style: TextStyle(color: Colors.black54,fontSize: 15.sp,fontWeight: FontWeight.bold),),
          
                  ],),
              )
            ],),),
          
          
          ],),),
        ),
      ),
    );
  }
}