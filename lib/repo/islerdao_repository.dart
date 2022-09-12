import 'package:todo_app/entity/isler.dart';
import 'package:todo_app/sqlite/veritabani_yardimcisi.dart';

class IslerDaoRepository{

  Future<void>isKayit(String is_ad) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = is_ad;
    await db.insert("yapilacaklar", bilgiler);

  }

  Future<void> isguncelle(int is_id,String is_ad) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = is_ad;
    await db.update("yapilacaklar", bilgiler ,where: "yapilacak_id = ?",whereArgs: [is_id]);
  }

  Future<List<Isler>> tumIsleriAl() async{
   var db = await VeritabaniYardimcisi.veritabaniErisim();
   List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");
   
   return List.generate(maps.length, (indeks) {
     var satir = maps[indeks];
     return Isler(is_id: satir["yapilacak_id"], is_ad: satir["yapilacak_is"]);
   });

  }

  Future<List<Isler>> isAra(String aramaKelimesi) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");

    return List.generate(maps.length, (indeks) {
      var satir = maps[indeks];
      return Isler(is_id: satir["yapilacak_id"], is_ad: satir["yapilacak_is"]);
    });

  }

  Future<void> isSil(int is_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar",where: "yapilacak_id = ?",whereArgs: [is_id]);
  }

}