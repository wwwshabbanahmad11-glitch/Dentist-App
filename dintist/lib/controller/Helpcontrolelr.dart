import 'package:get/get.dart';

class Helpcontrolelr extends GetxController{


  Gotohelpdetails(int id)async{
    Get.toNamed("/HelpDatails",arguments: {
      "id":id
    });

  }


}