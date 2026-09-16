import 'package:dintist/class/Sqlfite.dart';
import 'package:get/get.dart';

class Helpsdetailscontroller extends GetxController{
  int? id;
  Map? help_data;
  SqlDb sqlDb=SqlDb();

  Fetshdata()async{

    var response=await sqlDb.readData("SELECT *FROM Service_ditails WHERE id=$id ");
    print(response);
    help_data=response[0];
    update();
  return help_data;
  }





  @override
  void onInit() {
    id=Get.arguments["id"];
   // Fetshdata();
    // TODO: implement onInit
    super.onInit();
  }


}