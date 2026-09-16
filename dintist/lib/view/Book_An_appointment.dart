import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:table_calendar/table_calendar.dart';
import '../class/Appcolors.dart';
import 'package:get/get.dart';

import '../controller/BookAnAppointmentcontroller.dart';
class BookAnAppointment extends GetView<Bookanappointmentcontroller>{
  @override
  Widget build(BuildContext context) {
    Get.put(Bookanappointmentcontroller());
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
            onTap:(){
            controller.Save_Appointment(context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/14.png"))
              ),child:GetBuilder<Bookanappointmentcontroller>(
                builder: (con) {
                  return con.issure==true?CircularProgressIndicator(): Text("تأكيد الموعد",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.r),);
                }
              )
            ),
          ),),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            backgroundColor: Colors.grey[200]
        ,title: Text("حجز موعد",
            style: TextStyle(color: Appcolors.primary_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),centerTitle: true,),
          body: GetBuilder<Bookanappointmentcontroller>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:15.r),
                  width: 1.sw,
                  height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:EdgeInsets.symmetric(horizontal:10.r,vertical: 5.r),
                                child: Text("اختر التاريخ" ,style: TextStyle(color: Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold))),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: TableCalendar(
                                selectedDayPredicate: (day) {
                                  return isSameDay(controller.date, day);
                                },
                               onDaySelected: (d1,d2){
                                 controller.SelectedDay(d1);

                               },
                                calendarStyle: CalendarStyle(
                                  selectedDecoration: BoxDecoration(
                                    color: Appcolors.primary_green,
                                    shape: BoxShape.rectangle,                                  ),
                                  todayDecoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2060, 3, 14),
                                focusedDay: DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.r,right: 10.r),
                          child: Text("اختر الوقت" ,style: TextStyle(color:Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold))),

                     Wrap(
                       direction: Axis.horizontal,
                       children: [
                       ...List.generate(controller.hour.length, (i){
                         return  InkWell(
                           borderRadius: BorderRadius.circular(20.r),
                           onTap: (){
                             controller.colorcontainer(i);
                           },
                           child: Container(
                             width: 70.w,
                               height: 40.h,
                               margin: EdgeInsets.symmetric(horizontal: 5.r,vertical: 10.r),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   border: Border.all(width: 0.5,color: Colors.grey),
                                   borderRadius: BorderRadius.circular(10.r),
                                 image: DecorationImage(
                                     fit: BoxFit.fill,
                                     image:controller.i_container==i? AssetImage("images/14.png"):AssetImage("images/w.png"))
                               ),
                               padding: EdgeInsets.all(10.r),
                               alignment: Alignment.center,
                               child: Text("${controller.hour[i]}:00",style: TextStyle(color: controller.i_container==i?Colors.white:Colors.black),),),
                         );

                       })
                     ],),
                      Padding(
                          padding: EdgeInsets.only(top: 15.r,right: 10.r,bottom: 5.r),
                          child: Text("ملاحظات(اختياري)" ,style: TextStyle(color:Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold))),
                      TextFormField(
                        controller: controller.note,
                        maxLength: 100,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(20.r),
                          filled: true,
                          fillColor: Colors.white,
                          hint: Text("اكتب ملاحظاتك هنا ......."),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)
                          )
                        ),

                      ),

                    ],
                  ),
                ),
              );
            }
          ),
      ),
    );
  }
}