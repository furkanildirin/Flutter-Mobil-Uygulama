import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/AnaSayfa.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AnaSayfa(),
    );
  }
}

