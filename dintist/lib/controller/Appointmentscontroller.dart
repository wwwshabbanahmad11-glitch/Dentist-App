import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../class/service.dart';
import 'package:jiffy/jiffy.dart';
class Appointmentscontroller extends GetxController{
  bool Empty=false;
  int? id_card;
  Services service=Get.find();
  bool isdelete=false;
List App=[];
  Fetsh_Appiomtment()async{
    try{
      App.clear();
      update();
      CollectionReference apoiontment=await FirebaseFirestore.instance.collection("Users").doc("${service.sharedPreferences!.getString(("collection"))}").collection("Appointment");
      await apoiontment.where("date",isLessThan:Jiffy.parseFromDateTime(DateTime.now()).format(pattern: "dd/MM/yyyy") ).get().then((value){
        value.docs.forEach((element) {
          App.add({
            "id": element.id,
            ...element.data() as Map<String, dynamic>,
          });
        });
      });
      if(App.isEmpty){
        Empty=true;
        update();
      }else{
        update();
      }

      print(App);
    }catch(e){
       print("no data");
    }


  }
  Fetsh_Appiomtment_afterdatenow()async{
    try{
      App.clear();
      update();
      CollectionReference apoiontment=await FirebaseFirestore.instance.collection("Users").doc("${service.sharedPreferences!.getString(("collection"))}").collection("Appointment");
      await apoiontment.where("date",isGreaterThan:Jiffy.parseFromDateTime(DateTime.now()).format(pattern: "dd/MM/yyyy") ).get().then((value){
        value.docs.forEach((element) {
          App.add({
            "id": element.id,
            ...element.data() as Map<String, dynamic>,
          });
        });
      });
      if(App.isEmpty){
        Empty=true;
        update();
      }else{
        update();
      }

      print(App);
    }catch(e){
      print("no data");
    }


  }
deleteappiontment(i,String id)async{
    Empty=true;
    id_card=i;
    isdelete=true;
    update();
    CollectionReference appo=await FirebaseFirestore.instance.collection("Users").doc("${service.sharedPreferences!.getString(("collection"))}").collection("Appointment");
   await appo.doc(id).delete();
    App.removeAt(i);
    update();
    isdelete=false;
    update();
}
  @override
  void onInit() {
    Fetsh_Appiomtment_afterdatenow();
    // TODO: implement onInit
    super.onInit();
  }


}