import 'package:flutter/material.dart';

Widget BASLIK(String baslik, context){

 return Column(
   crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 29,),

  //GERİ ICONU
  GestureDetector(
    onTap:() {
      Navigator.pop(context);
      },
  child: Icon(Icons.arrow_back, color: Colors.black, size: 30),),



  SizedBox(height: 9),


  Text(baslik, style: TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black),),

  ],
  );


}