import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Urunler.dart';
import 'AnaSayfa.dart';
import 'Bilesenler/Navigatorbuton.dart';
import 'Urunler.dart';

class DetaySayfa extends StatefulWidget {
  Urunler urun;
  DetaySayfa(this.urun);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("${widget.urun.urun_ad}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10,),
            Image.asset("Dosyalar/images/${widget.urun.urun_resim}"),

            Text(
              widget.urun.urun_ad.toString(),
              style: TextStyle(fontSize: 26,color: Colors.black,
                fontWeight: FontWeight.bold,),
            ),
            Text("512 Gb Ssd    "+
              widget.urun.urun_renk.toString(),
              style: TextStyle(fontSize: 19,color: Colors.black,
                fontWeight: FontWeight.bold,),
            ),
            Text(
              widget.urun.urun_fiyat.toString() + " TL",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                color: Colors.purple[900],
              ),
              child: Text("Sepete Ekle",
                textAlign: TextAlign.center
                ,style: TextStyle(fontSize: 20,color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            ),
            Navigatorbar(sayfa: 'Arama',widget: AnaSayfa(),context: context), ],
        ),
      ),
    );
  }
}
