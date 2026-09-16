import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:get/get.dart';
import '../class/Appcolors.dart';
import '../controller/QuestionController.dart';
import '../controller/ReplyController.dart';

class Replydoctor extends GetView<Replycontroller>{
  @override
  Widget build(BuildContext context) {
    Get.put(Replycontroller());
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("الرسائل الواردة",style: TextStyle(color: Appcolors.secound_green,fontSize: 23.sp,fontWeight: FontWeight.bold)),centerTitle: true,),
        body: Container(
          margin: EdgeInsets.all(5.r),
          width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20.r),
                alignment: Alignment.centerRight,
                width: 1.sw,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/bac1.png"))
                ),child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("الرسائل الواردة ",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                  Text("الترتيب حسب القدم",textAlign: TextAlign.right,style: TextStyle(color: Colors.white60,fontSize: 13.sp,fontWeight: FontWeight.bold)),
                ],),
              ),
              SizedBox(height: 5.r,),
              Text("المحادثة",textAlign: TextAlign.right,style: TextStyle(color: Appcolors.primary_green,fontSize: 20.sp,fontWeight: FontWeight.bold)),
              Divider(),
              GetBuilder<Replycontroller>(
                  builder: (controller) {
                    return Flexible(
                      child: Container(padding: EdgeInsets.all(7.r),width: 1.sw,height: 400.h,child: ListView(children: [

                        ?  controller.Question.isEmpty?Center(child: Text("لا يوجد رسائل واردة"),):Column(children: [...List.generate(controller.Question.length, (i){
                          return controller.Question[i]["id"]=="S"? Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.r),
                            child: Row(
                              mainAxisAlignment:controller.Question[i]["id"]=="S"? MainAxisAlignment.end:MainAxisAlignment.start,
                              children: [
                                BubbleSpecialThree(
                                  text:controller.Question[i]["message"],
                                  color:controller.Question[i]["id"]=="S"? Color(0xFFE8E8EE): Color(0xFF1B97F3),
                                  tail:i==controller.Question.length-1?true:false,
                                  isSender: controller.Question[i]["id"]=="S"?false:true,
                                  textStyle:controller.Question[i]["id"]=="D" ?TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ):TextStyle(),
                                ),
                                ?  i==controller.Question.length-1  && controller.Question[i]["id"]=="S"?   CircleAvatar(backgroundColor: Colors.grey,radius: 20.r,child: Icon(Icons.person,color: Colors.white,size: 40,)):null,
                              ],),
                          ):Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.r),
                            child: Row(
                              mainAxisAlignment:controller.Question[i]["id"]=="S"? MainAxisAlignment.end:MainAxisAlignment.start,
                              children: [
                                ?  i==controller.Question.length-1  && controller.Question[i]["id"]=="D"?  CircleAvatar(
                                  backgroundImage:AssetImage("images/hasan.png"),radius: 20.r,):null,
                                BubbleSpecialThree(
                                  text:controller.Question[i]["message"],
                                  color:controller.Question[i]["id"]=="S"? Color(0xFFE8E8EE): Color(0xFF1B97F3),
                                  tail:i==controller.Question.length-1?true:false,
                                  isSender: controller.Question[i]["id"]=="S"?false:true,
                                  textStyle:controller.Question[i]["id"]=="D" ?TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ):TextStyle(),
                                ),
                              ],),
                          );
                        })],),
                      ],),),
                    );
                  }
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(bottom: 10.r,left: 4.r,right: 4.r),
                child: TextFormField(
                  controller: controller.message,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hint: Text("اكتب سؤالك هنا.."),
                      icon: IconButton(onPressed: (){
                        controller.ReplyDoctor();
                      }, icon:  Icon(Icons.telegram,color:Appcolors.primary_green,size: 50.r,),),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.r)
                      )
                  ),
                ),
              ),

            ],),
        ),


      ),
    );
  }
}