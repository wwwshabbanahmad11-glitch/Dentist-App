import 'package:dintist/view/Appointments.dart';
import 'package:dintist/view/Book_An_appointment.dart';
import 'package:dintist/view/Contact.dart';
import 'package:dintist/view/Help_datails.dart';
import 'package:dintist/view/Home.dart';
import 'package:dintist/view/Help.dart';
import 'package:dintist/view/Question.dart';
import 'package:dintist/view/Start.dart';
import 'package:dintist/view/artical.dart';
import 'package:dintist/view/auth/login.dart';
import 'package:dintist/view/profile.dart';
import 'package:dintist/view/test.dart';
import 'package:dintist/view/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import 'class/Approute.dart';
import 'class/service.dart';

void main()async{
 await WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 await intial_service();
 return runApp(App());
}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilPlusInit(
    designSize: Size(360,690),
      minTextAdapt: true,
      builder: (context,child){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
   //  home: Verify(),
 initialRoute:"/Start",
        getPages: getPages,
      );
    },
    );
  }
}