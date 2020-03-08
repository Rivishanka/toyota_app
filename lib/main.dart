import 'package:flutter/material.dart';
import 'UI/HomePage.dart';

void main(){
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.redAccent,accentColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}