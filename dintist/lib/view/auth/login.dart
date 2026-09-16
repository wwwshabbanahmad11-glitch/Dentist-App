import 'package:dintist/class/Appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/auth/logincontroller.dart';

class Login extends GetView<Logincontroller>{
  Logincontroller controller=Get.put(Logincontroller());
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: controller.stateform1,
              child: Container(
                alignment: Alignment.center,
                width: 1.sw,
                height: 1.sh,
                margin: EdgeInsets.only(top: 150.r,right: 15.r,left: 15.r),child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("images/tooth.svg",color: Appcolors.primary_green,width:100.w,height: 100.h, ),
                 SizedBox(height: 15.h,),
                  Text(" ابتسامتك أولويتنا",style: TextStyle(color:Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: TextFormField(
                      validator: (val){
                      return  controller.validator_email(val);
                      },
                      controller: controller.email,
                      decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hint: Text("البريد الالكتروني أو رقم الجوال",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
                      suffixIcon: Icon(Icons.email,color: Colors.grey,),
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      )
                    ),),
                  ),
                  GetBuilder<Logincontroller>(
                    builder: (con) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: TextFormField(
                          validator: (val){
                            return controller.validator_pass(val);
                          },
                          controller: controller.pass,
                          obscureText: controller.obccure,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hint: Text("كلمة المرور",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
                            suffixIcon: IconButton(onPressed: (){
                              controller.change_showpass();
                            }, icon: Icon(Icons.remove_red_eye,color: Colors.grey,)),                border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)
                        )
                        ),),
                      );
                    }
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15.r),
                      width: 1.sw,child: InkWell(
                      onTap: (){},
                      child: Text("هل نسيت كلمة المرور؟",style: TextStyle(color:Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold))),),

                  SizedBox(height: 20.r,),
                  GetBuilder<Logincontroller>(
                    builder: (con) {
                      return MaterialButton(onPressed: (){
                        controller.login(context);
                      },color:Appcolors.secound_green,padding: EdgeInsets.symmetric(horizontal: 100.r,vertical: 7.r),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                        child:controller.isslogin ==true?CircularProgressIndicator():Text("تسجيل الدخول",style: TextStyle(color:Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold)),);
                    }
                  ),
                  SizedBox(height: 20.r,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("ليس لديك حساب؟",style: TextStyle(color:Colors.black87,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                    InkWell(
                        onTap: (){
                       Get.offNamed("/Signup");
                        },
                        child: Text("انشاء حساب ",style: TextStyle(color:Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold)))
                  ],)
              ],),),
            ),
          ),

        ),
      );
  }
}