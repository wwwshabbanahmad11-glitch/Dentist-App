import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import '../class/Appcolors.dart';
import 'package:jiffy/jiffy.dart';

import '../controller/Appointmentscontroller.dart';
class Appointments extends GetView<Appointmentscontroller>{
  @override
  Widget build(BuildContext context) {
    Get.put(Appointmentscontroller());
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white.withOpacity(0),
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal:10.r),
          child: InkWell(
            onTap: (){
            Get.toNamed( "/Help");
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/14.png"))
                ),child:Text("حجز موعد جديد",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.r),)
            ),
          ),),
        appBar: AppBar(title: Text("مواعيدي",style: TextStyle(color: Appcolors.secound_green,
            fontSize: 23.sp,
            fontWeight: FontWeight.bold)),centerTitle: true,),
        body: GetBuilder<Appointmentscontroller>(
          builder: (controller) {
            return Container(
              alignment: Alignment.center,
             margin: EdgeInsets.all(10.r)
            ,child: Column(
              children: [
              Card(
                margin: EdgeInsets.all(0.r),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(30.r),bottomRight: Radius.circular(20.r))

                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    InkWell(
                      onTap: (){
                        controller.Fetsh_Appiomtment();
                      },borderRadius: BorderRadius.circular(22),
                      child: Card(
                        margin: EdgeInsets.all(0.r),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r))
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 150.r,height: 40.h,decoration:BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r))
                        ),child: Text("السابقة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),),
                      ),),
                    InkWell(
                   borderRadius: BorderRadius.circular(22),
                      onTap: (){
                     controller.Fetsh_Appiomtment_afterdatenow();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 140.r,height: 40.h,decoration:BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(30.r),bottomRight: Radius.circular(20.r))
                      ),child: Text("الحالية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp)),),
                    ),
                  ],),
                ),
              ),
                SizedBox(height: 20.h,),
             controller.App.isEmpty && controller.Empty==false? Center(child: CircularProgressIndicator(),):controller.App.isEmpty &&controller.Empty==true?Center(child: Text("لا يوجد مواعيد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp)),):   Flexible(
                    fit: FlexFit.tight,
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      children: [
                   ...List.generate(controller.App.length, (i){
                     return Card(
                       margin: EdgeInsets.only(top:10.r,left: 15.r,right: 15.r),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20.r)
                       ),
                       child: Container( margin: EdgeInsets.only(top:10.r,left: 10.r,right: 10.r),width: 1.sw,height: 120.h,decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20.r)
                       ),child: Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Text(" ${controller.App[i]["name_helps"]} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp)),
                                 IconButton(onPressed: (){
                                   controller.deleteappiontment(i,controller.App[i]["id"]);
                                 }, icon:controller.isdelete==false?Icon(Icons.delete,color: Colors.red,):controller.isdelete==true && controller.id_card==i? CircularProgressIndicator():Icon(Icons.delete,color: Colors.red,))
                               ]),

                         Expanded(
                           flex:1,
                           child: Column(
                             children: [
                               ListTile(leading: Icon(Icons.date_range),title: Text("االتاريخ:"),subtitle:Text("${controller.App[i]["date"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp)) ,),
                               ListTile(leading: Icon(Icons.punch_clock_rounded),title: Text("الوقت:"),subtitle: Text("${controller.App[i]["Time"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp,color: Colors.grey)) ,)



                           ],),
                         ),

                       ],),),
                     );
                   })
                ],))

            ],),);
          }
        ),

      ),
    );
  }
}