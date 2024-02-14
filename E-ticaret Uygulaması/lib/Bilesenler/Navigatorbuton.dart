import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/AnaSayfa.dart';
import 'package:untitled5/urunlist.dart';

Widget Navigatorbar({
  required String sayfa,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context!, MaterialPageRoute(builder: (context) {
            return widget!;
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -3),
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10)
            ],
            color: Colors.white,
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNav(
                iconData: Icons.home_filled,
                active: sayfa == "AnaSayfa",
                widget: AnaSayfa(),
                context: context,
              ),
              buildNav(
                  iconData: Icons.search_rounded,
                  active: sayfa == "Arama",
                  widget: UrunListe(),
                  context: context),
              buildNav(
                  iconData: Icons.shopping_cart_sharp,
                  active: sayfa == "Sepet"),
              buildNav(iconData: Icons.person, active: sayfa == "Profil"),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildNav(
    {required IconData iconData, required bool active, widget, context}) {
  return Icon(iconData,
      size: 23, color: Color(active ? 0xFF4A148C : 0xFF424242));
}
