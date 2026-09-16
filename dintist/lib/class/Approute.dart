

import 'package:get/get.dart';

import '../view/Appointments.dart';
import '../view/Appscreen.dart';
import '../view/Book_An_appointment.dart';
import '../view/Contact.dart';
import '../view/Help.dart';
import '../view/Help_datails.dart';
import '../view/Home.dart';
import '../view/Question.dart';
import '../view/ReplyDoctor.dart';
import '../view/Start.dart';
import '../view/artical.dart';
import '../view/auth/Signup.dart';
import '../view/auth/login.dart';
import '../view/profile.dart';
import '../view/verify.dart';
import 'Middleware.dart';

List<GetPage<dynamic>>? getPages=[
  GetPage(name: "/Start", page: ()=>Start(),),
  GetPage(name: "/Home", page: ()=>Home(),transition: Transition.fade,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Appointments", page: ()=>Appointments()),
  GetPage(name: "/Help", page: ()=>Help()),
  GetPage(name: "/HelpDatails", page: ()=>HelpDatails(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/BookAnAppointment", page: ()=>BookAnAppointment(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Artical", page: ()=>Artical(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Profile", page: ()=>Profile(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Login", page: ()=>Login(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Question", page: ()=>Question(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Replydoctor", page: ()=>Replydoctor(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),

  GetPage(name: "/Appscreen", page: ()=>Appscreen(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Signup", page: ()=>Signup(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),


  GetPage(name: "/Contact", page: ()=>Contact(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),
  GetPage(name: "/Verify", page: ()=>Verify(),transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 888)),

];