import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYrd
{
  static final String VeritabaniAdi="urunler.sqlite";

  static Future<Database> vtErisim() async
  {
    String VeritabaniYolu=join(await getDatabasesPath(),VeritabaniAdi);

    if(await databaseExists(VeritabaniYolu))
    {
      print("Database Kayıtlı Ürün");
    }
    else {
      ByteData data=await rootBundle.load(("veritabani/$VeritabaniAdi"));
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File (VeritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Ürün Veritabanina Kopyalandi");
    }

    return openDatabase(VeritabaniYolu);
  }

}