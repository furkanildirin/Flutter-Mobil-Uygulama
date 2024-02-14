
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled5/DetaySayfa.dart';
import 'package:untitled5/Urunler.dart';
import 'package:untitled5/Urunlerdao.dart';
class Favoriler extends StatefulWidget {



  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  Future<List<Urunler>> tumUrunleriGoster() async{
    var urunlerListesi= await Urunlerdao().tumUrunler();
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler",style: TextStyle(fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white),),
      ),

      body: FutureBuilder<List<Urunler>>(
        future: tumUrunleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var urunlerListesi=snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),

              itemCount: urunlerListesi!.length,
              itemBuilder: (context,indeks){
                var Urunler=urunlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(Urunler)));
                  },

                  child: Card(

                    child: SizedBox(height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Image.asset("Dosyalar/images/${Urunler.urun_resim}"),
                          Text(Urunler.urun_ad,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          Text(Urunler.urun_fiyat+" TL",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 16)),
                        ],

                      ),
                    ),

                  ),


                );

              },



            );

          }

          return Center(child: Text(
            "Favori Ürün Bulunamadı! Diğer Ürünlere Bakabilirsiniz",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),);
        },

      ),




    );
  }
}
