import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget etiket(String text){
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.purple[300]),
    child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize:12),),
  );


}