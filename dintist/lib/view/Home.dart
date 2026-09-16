import 'package:dintist/class/Sqlfite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../controller/Homecontroller.dart';

class Home extends GetView<Homecontroller>{
SqlDb sqlDb=SqlDb();

  Homecontroller controller=Get.put(Homecontroller());
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBody: true,

     backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,actions:[
        IconButton(onPressed: (){
        controller.logout();
          }, icon: Icon(Icons.notifications_active_outlined)),
        Padding(
            padding: EdgeInsets.only(right: 10.r,left: 10.r),
            child: CircleAvatar(backgroundImage: AssetImage("images/hasan.png"),))] ,),
      //drawer: Drawer(),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset("images/5.png"),
              Positioned(
                top: 20.r,
                right: 5.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("مرحباً بك",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold),),
                    Text("نحن هنا من أجل ابتسامتك",style: TextStyle(color:Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
          ],),
          Flexible(
              fit: FlexFit.tight,
              child:Card(
                margin: EdgeInsets.all(0.r),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r))
                ),
                child: Container(
                  padding: EdgeInsets.only(right:6.r,left: 6.r,top: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r))
                  ),
                  width: 1.sw,child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)
                            ],
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: InkWell(
                            onTap: (){
                              controller.gotoAppointments();
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              SvgPicture.asset("images/calendar.svg",height: 20.h,width: 20.w,color: Appcolors.gold,),
                              Text("مواعيد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                            ],),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            controller.gotohelps();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("images/service.svg",height: 20.h,width: 20.w,color:Appcolors.secound_green,),
                                Text("خدمات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                              ],),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Get.toNamed("/Question");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("images/business.svg",height: 20.h,width: 20.w,color: Appcolors.gold,),
                                Text("استشارات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                              ],),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Get.toNamed( "/Artical");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("images/article.svg",height: 20.h,width: 20.w,color: Appcolors.primary_green,),
                                Text("مقالات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                              ],),
                          ),
                        ),
                      ),

                    ],),
                  Padding(
                      padding: EdgeInsets.all(6.r),
                      child: Text("خدماتنا",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold),)),
                    Row(children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.r),
                                height: 100.h,decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("images/10.png"))
                              ),),

                              Text("زراعة أسنان",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17.sp),)
                            ],),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.r),
                                height: 100.h,decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/11.png"))
                              ),),

                              Text("تبييض أسنان",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17.sp),)
                            ],),
                        ),
                      ),Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 10)                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.r),
                                height: 100.h,decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/6.jpg"))
                              ),),

                              Text("تقويم أسنان",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17.sp),)
                            ],),
                        ),
                      ),

                    ],),
                ],),),
              ))
        ],
      ),
    );
  }
}