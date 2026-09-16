import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await intialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  intialDb() async {
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'dintist.db') ;
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1  , onUpgrade:_onUpgrade ) ;
    return mydb ;
  }
//من اجل اضافة  عمود جديد الى قاعدة البيانات
  _onUpgrade(Database db , int oldversion , int newversion )async {

    print("onUpgrade =====================================") ;

  }

  _onCreate(Database db , int version) async {
    await db.execute('''
  CREATE TABLE Service_ditails (
    "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "title" TEXT ,
     "image" TEXT,
    "price" TEXT ,
    "description" TEXT ,
    "features"   TEXT
  )
 ''') ;
    await db.execute('''
  CREATE TABLE Artical (
     "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, 
     "title" TEXT ,
     "cat" TEXT,
     "category" TEXT,
     "image" TEXT ,
     "description" TEXT ,
     "content"   TEXT
  )
 ''') ;
    print(" onCreate =====================================") ;

  }

  readData(String sql) async {
    Database? mydb = await db ;
    List<Map> response = await  mydb!.rawQuery(sql);
    return response ;
  }
  insertData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawInsert(sql);
    return response ;
  }
  updateData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawUpdate(sql);
    return response ;
  }
  deleteData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawDelete(sql);
    return response ;
  }
// طريقة اخرى لكتابة الكود
  readDB(String table) async {
    Database? mydb = await db ;
    List<Map> response = await  mydb!.query(table);
    return response ;
  }
  insertDB(String table,Map<String, Object?> values) async {
    Database? mydb = await db ;
    int  response = await  mydb!.insert(table,values);
    return response ;
  }
  updateDB(String table,Map<String, Object?> values,String mywhere) async {
    Database? mydb = await db ;
    int  response = await  mydb!.update(table,values,where: mywhere);
    return response ;
  }
  deleteDB(String table,String mywhere) async {
    Database? mydb = await db ;
    int  response = await  mydb!.delete(table,where: mywhere );
    return response ;
  }
// SELECT
// DELETE
// UPDATE
// INSERT
// من اجل الحذف النهائي لل data base
  MyDeleteDatabase()async{
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'NaBtA.db') ;
    await deleteDatabase(path);
    print("done");
  }

}