import 'package:dintist/class/Sqlfite.dart';
import 'package:get/get.dart';

class Articalcontroller extends GetxController{
SqlDb sqlDb=SqlDb();
  bool isAll=false;
 List artical=[];
  int? i_card;
  List <Map> cat=[

    {
      "image":"images/tooth-svgrepo.svg",
      "name":"زراعة وتقويم"
    },
    {
      "image":"images/tooth-brush-.svg",
      "name":"العناية اليومية"
    },
    {
      "image":"images/tooth-teeth.svg",
      "name":"تجميل الأسنان"
    },
    {
      "image":"images/baby.svg",
      "name":"أسنان الأطفال"
    },
    {
      "image":"images/tooth-human.svg",
      "name":"صحة الأسنان"
    },

  ];
GetAlldata()async{
  i_card=null;
  artical.clear();
  isAll=true;
  update();
  var response=await sqlDb.readDB("Artical");
  artical.addAll(response);

  update();


}
fetshArtical( int i)async{
  i_card=i;
  isAll=false;
  artical.clear();
  update();
  await Future.delayed(Duration(seconds: 1));
  var response=await sqlDb.readData("SELECT *FROM Artical WHERE cat=$i");
  artical.addAll(response);
  update();
}
@override
  void onInit() {
    GetAlldata();
    // TODO: implement onInit
    super.onInit();
  }


}