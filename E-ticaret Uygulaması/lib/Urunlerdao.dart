import 'package:untitled5/Urunler.dart';
import 'package:untitled5/VeritabaniYrd.dart';

class Urunlerdao {
  Future<List<Urunler>> tumUrunler() async {
    var db = await VeritabaniYrd.vtErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM urunler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Urunler(satir["urun_id"], satir["urun_ad"], satir["urun_fiyat"],
          satir["urun_renk"], satir["urun_resim"]);
    });
  }
}
