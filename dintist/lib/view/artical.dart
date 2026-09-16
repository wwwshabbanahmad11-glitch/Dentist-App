import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../controller/Articalcontroller.dart';

class Artical extends GetView<Articalcontroller>{
  Articalcontroller controller=Get.put(Articalcontroller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar( backgroundColor: Colors.grey[100],title: Text("المقالات",style: TextStyle(color: Appcolors.secound_green,
            fontSize: 23.sp,
            fontWeight: FontWeight.bold)),centerTitle: true,),
        body: GetBuilder<Articalcontroller>(
          builder: (controller) {
            return Container(width: 1.sw,height: 1.sh,margin: EdgeInsets.all(10.r),
              child: Column(children: [
              // TextFormField(decoration: InputDecoration(
              //   filled: true,
              //   fillColor: Colors.white,
              //   hint: Text("ابحث عن مقال...",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
              //   suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(25.r)
              //   )
              // ),),
              SizedBox(height: 10.h,),
              Row(children: [
                  InkWell(
                    onTap: (){
                      controller.GetAlldata();
                    },
                    child: Card(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r)
                      ) ,
                      child: Container(
                        //  margin: EdgeInsets.symmetric(horizontal:3.r),
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                            color:controller.isAll==true?Appcolors.primary_green: Colors.white,
                            borderRadius: BorderRadius.circular(15.r)
                        ),child: Column(children: [
                        Opacity(
                          opacity: 0.65,
                          child: SvgPicture.asset("images/tooth.svg",width: 30.w,height: 30.h,color:controller.isAll==true?Colors.white:Appcolors.primary_green,),),
                        Text("الكل",style: TextStyle(color:controller.isAll==true?Colors.white:Appcolors.primary_green,fontSize: 11.sp,fontWeight: FontWeight.bold))
                      ],),),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...List.generate(controller.cat.length, (i){
                            return   InkWell(
                              onTap: (){
                              controller.fetshArtical(i);
                              },
                              child: Card(
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r)
                                ) ,
                                child: Container(
                                  //  margin: EdgeInsets.symmetric(horizontal:3.r),
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                      color:controller.i_card==i?Appcolors.primary_green: Colors.white,
                                      borderRadius: BorderRadius.circular(15.r)
                                  ),child: Column(children: [
                                  Opacity(
                                    opacity: 0.65,
                                    child: SvgPicture.asset("${controller.cat[i]["image"]}",width: 30.w,height: 30.h,color:controller.i_card==i?Colors.white:Appcolors.primary_green,),),
                                  Text("${controller.cat[i]["name"]}",style: TextStyle(color:controller.i_card==i?Colors.white:Appcolors.primary_green,fontSize: 11.sp,fontWeight: FontWeight.bold))
                                ],),),
                              ),
                            );
                          })
                        ],),

                    ),
                  ),

                ],),

             SizedBox(height: 10.h,),
            controller.artical.isEmpty?Center(child: CircularProgressIndicator(),): Flexible(child: ListView(children: [
                  ...List.generate(controller.artical.length, (i){
                    return Container(
                      padding: EdgeInsets.all(5.r),
                     margin: EdgeInsets.only(top: 5.r),
                    width: 1.sw,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Expanded(child: Container(alignment: Alignment.topLeft,height: 110.h,child: Icon(Icons.bookmark_outline_outlined,color:Appcolors.secound_green,))),
                        Expanded(
                          flex:3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end  ,
                            children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(10.r)
                            ),padding: EdgeInsets.symmetric(horizontal:5.r),margin: EdgeInsets.only(top: 10.r,left: 5.r),
                              child: Text("${controller.artical[i]["category"]}",style: TextStyle(color: Appcolors.primary_green),),),
                              Text("${controller.artical[i]["title"]}ً",style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontSize: 15.sp)),
                              Text("${controller.artical[i]["description"]}",style: TextStyle(color:Colors.black54),),

                              InkWell(
                                onTap:(){

                                  },
                                  child: Text("أفرأ المزيد..",style: TextStyle(color: Colors.green,fontSize: 12.sp,fontWeight: FontWeight.bold),),)

                          ],),
                        ),
                      SizedBox(width: 10.r,),
                      Expanded(
                        flex:2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)
                        ),margin: EdgeInsets.all(5.r),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit:BoxFit.fill,
                                    image: AssetImage("images/${controller.artical[i]["image"]}")),
                              borderRadius: BorderRadius.circular(10.r)
                          ),width: 140.w,height: 140.h,),),
                      ),


                    ],),);
                  })
                ],))
            ],),);
          }
        ),
      ),
    );
  }
}