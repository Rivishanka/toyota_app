import 'package:flutter/material.dart';
import 'package:toyota_app/UI/splashScreen.dart';


void main(){
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Color(0xFF0D47A1),accentColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: HomePage2(),
  ));
}