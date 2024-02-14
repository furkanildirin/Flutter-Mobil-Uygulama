import 'package:flutter/material.dart';
import 'package:untitled5/Bilesenler/etiket.dart';
import 'package:untitled5/Bilesenler/Navigatorbuton.dart';
import 'package:untitled5/Favoriler.dart';
import 'package:untitled5/urunlist.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    double ekranboy = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //BASLIK

                  buildBaslik(),

                  //BANNER

                  buildBanner(),

                  //DAIREBUTONLAR
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDaireler(
                            text: "Kategoriler",
                            icon: Icons.menu,
                            widget: UrunListe(),
                            context: context),
                        buildDaireler(
                            text: "Favoriler",
                            icon: Icons.favorite,
                            widget: Favoriler(),
                            context: context),
                        buildDaireler(
                          text: "Hediyeler",
                          icon: Icons.card_giftcard,
                        ),
                        buildDaireler(
                          text: "Popüler",
                          icon: Icons.star,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // Vitrin
                  Text(
                    "Vitrin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 18),
                  //EŞYALAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildEsyalar(
                        text: "Samsung S22",
                        gorsel: "Dosyalar/images/samsungs221.png",
                        indirim: "-25%",
                        ekranboy: ekranboy,
                      ),
                      buildEsyalar(
                        text: "İphone 11 Pro",
                        gorsel: "Dosyalar/images/Pro11.png",
                        indirim: "-20%",
                        ekranboy: ekranboy,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildEsyalar(
                        text: "Macbook Pro",
                        gorsel: "Dosyalar/images/Macbook3.png",
                        indirim: "-15%",
                        ekranboy: ekranboy,
                      ),
                      buildEsyalar(
                        text: "GamePower Monitör",
                        gorsel: "Dosyalar/images/Gamepowermonitor.png",
                        indirim: "-30%",
                        ekranboy: ekranboy,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            //NAVIGATOR BARI
            Navigatorbar(
                sayfa: 'AnaSayfa', widget: UrunListe(), context: context),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Ana Sayfa",
      style: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
          color: Colors.purple[900],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apple Macbook Air",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  "18400 TL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Image.asset("Dosyalar/images/macbook1.png"),
          ],
        ),
      ));
}

Widget buildDaireler({
  required String text,
  required IconData icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.purple[100]),
          child: Icon(icon, color: Colors.purple[900], size: 20),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildEsyalar({
  required String text,
  required String gorsel,
  required String indirim,
  required double ekranboy,
}) {
  return Container(
    width: (ekranboy - 60) * 0.5,
    padding: EdgeInsets.only(
      left: 12,
      right: 12,
      top: 12,
      bottom: 21,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        etiket(indirim),
        SizedBox(height: 15),
        Image.asset(gorsel),
        SizedBox(height: 15),
        Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        )
      ],
    ),
  );
}
