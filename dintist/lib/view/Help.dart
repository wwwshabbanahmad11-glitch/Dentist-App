import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../class/Appcolors.dart';
import '../class/Sqlfite.dart';
import '../controller/Helpcontrolelr.dart';

class Help extends GetView<Helpcontrolelr>{
  //SqlDb sqlDb=SqlDb();
  @override
  Widget build(BuildContext context) {
    Get.put(Helpcontrolelr());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.grey[100],
       title: Text(" خدماتنا",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(15.r),
        width: 1.sw,height: 1.sh,decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(70.r),topLeft: Radius.circular(70.r)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/bacground.png"))
      ),child: ListView(children: [
         Card(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
           child: Container(
               padding: EdgeInsets.symmetric(horizontal:5.r),
             width: 1.sw,
             decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10.r)
           ),child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Container(
               height: 100.r,
               width: 100.r,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.r),
                   image: DecorationImage(
                       fit: BoxFit.fill,
                       image: AssetImage("images/a3.png",))
               ),),
             Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                Text("تبييض الأسنان",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
               Text("ابتسامة أكثر اشراقاً",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
             ],),
            IconButton(onPressed: (){
                controller.Gotohelpdetails(2);
            }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))
           ],)),
         ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a7.png",))
                ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text("تقويم أسنان",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                Text("تقويم دقيق ونتائج مثالية",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
              ],),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(3);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a8.png",))
                ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text("زراعة الأسنان",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                Text("تعويض دائم وضرس يدوم",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
              ],),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(6);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a1.png",))
                ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text("علاج الجذور",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                Text("علاج فعال للآلام الأسنان",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
              ],),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(4);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a.png",))
                ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text("حشوات تجميلية",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                Text("حلول جمالية تدوم طويلاً",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
              ],),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(5);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a4.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("فحص وتنظيف",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("وقاية للحفاظ على صحة أسنانك",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(1);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a5.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("خلع الأسنان",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("خلع الأسنان منم دون ألم",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(7);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a6.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("تركيب بدلة",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("بدلة مناسبة ولن تشعر بالفرق",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(8);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a11.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("علاج اللثة",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("علاج مناسب لجميع الحالات",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(9);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a12.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("طب الاسنان للأطفال",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("تعامل مريح مع الأطفال ووسائل تسلية",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(10);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:5.r),
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)
              ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.r,
                width: 100.r,
                decoration: BoxDecoration(
                    color: Appcolors.primary_green,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/a9.png",))
                ),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("طوارئ الأسنان",style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                  Text("خدمة على مدار الوقت لأستقبال اي حالة",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold))
                ],),
              ),
              IconButton(onPressed: (){
                controller.Gotohelpdetails(11);

              }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: Appcolors.primary_green,))

            ],)),
        ),
      ],),),

    );
  }
}