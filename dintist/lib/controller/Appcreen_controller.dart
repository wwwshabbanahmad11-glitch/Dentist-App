import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppcreenController extends GetxController{

  PageController? pageController;
  @override
  void onInit() {
    pageController=PageController();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    pageController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}