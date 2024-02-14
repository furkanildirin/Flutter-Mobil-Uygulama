import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/DetaySayfa.dart';
import 'package:untitled5/Urunler.dart';
import 'package:untitled5/Urunlerdao.dart';

class UrunListe extends StatefulWidget {
  @override
  State<UrunListe> createState() => _UrunListeState();
}

class _UrunListeState extends State<UrunListe> {
  Future<List<Urunler>> tumUrunleriGoster() async {
    var urunlerListesi = await Urunlerdao().tumUrunler();
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laptop",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Urunler>>(
        future: tumUrunleriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var urunlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: urunlerListesi!.length,
              itemBuilder: (context, indeks) {
                var Urunler = urunlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfa(Urunler)));
                  },
                  child: Container(
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                                "Dosyalar/images/${Urunler.urun_resim}"),
                            Text(Urunler.urun_ad,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(Urunler.urun_fiyat + " TL",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(right: 15,left: 15),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                                color: Colors.purple[900],
                              ),
                              child: Text("SATIN AL",
                                textAlign: TextAlign.center
                                ,style: TextStyle(fontSize: 16,color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text(
              "Ürün Bulunamadı Lütfen Anasayfaya Dönün!",
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
