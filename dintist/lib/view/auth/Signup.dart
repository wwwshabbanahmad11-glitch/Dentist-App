import 'package:dintist/class/Appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/auth/logincontroller.dart';
import '../../controller/auth/signupcontroller.dart';

class Signup extends GetView<Signupcontroller>{
  Signupcontroller controller=Get.put(Signupcontroller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child:Form(
            autovalidateMode: AutovalidateMode.always,
            key: controller.stateform,
            child: Container(
              alignment: Alignment.center,
              width: 1.sw,
              height: 1.sh,
              margin: EdgeInsets.only(top: 150.r,right: 15.r,left: 15.r),child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("images/tooth.svg",color: Appcolors.primary_green,width:100.w,height: 100.h, ),
                SizedBox(height: 15.h,),
                Text(" إنساء حساب جديد",style: TextStyle(color:Appcolors.secound_green,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: TextFormField(
                    validator: (val){
                     return controller.validator_email(val);
                    },
                    controller: controller.email,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hint: Text("البريد الالكتروني أو رقم الجوال",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
                        suffixIcon:  Icon(Icons.email,color: Colors.grey,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                    )
                    ),),
                ),
                GetBuilder<Signupcontroller>(
                  builder: (con) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: TextFormField(
                        validator: (val){
                        return  controller.validator_pass(val);
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
                SizedBox(height: 20.r,),
                GetBuilder<Signupcontroller>(
                  builder: (con) {
                    return MaterialButton(onPressed: (){
                        controller.Signup(context);
                    },color:Appcolors.secound_green,padding: EdgeInsets.symmetric(horizontal: 100.r,vertical: 7.r),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),child:controller.issignup==true?CircularProgressIndicator(): Text(" إنشاء حساب",style: TextStyle(color:Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold)),);
                  }
                ),
                SizedBox(height: 20.r,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" لديك حساب؟",style: TextStyle(color:Colors.black87,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                    InkWell(
                        onTap: (){
                       Get.offNamed("/Login");
                        },
                        child: Text("تسجيل الدخول",style: TextStyle(color:Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold)))
                  ],)
              ],),),
          ),
        ),

      ),
    );
  }
}