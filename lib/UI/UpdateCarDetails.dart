import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:bordered_text/bordered_text.dart';


class UpdateCarDetails extends StatefulWidget {

  final Car car;

  UpdateCarDetails({Key key, @required this.car}) : super(key: key);

  String Colour;
  String Image;
  String MPG;
  String Model;
  String NoOfSheets;
  String Price;
  String SpecialFeatures;

  @override
  _UpdateCarDetailsState createState() => new _UpdateCarDetailsState();

}
class _UpdateCarDetailsState extends State<UpdateCarDetails>{
  VehicleAPI api = new VehicleAPI();
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();


  String Colour;
  //String Image;
  String MPG;
  String Model;
  String NoOfSheets;
  String Price;
  String SpecialFeatures;
  Car car;
  @override
  void initState(){
    super.initState();
    car = widget.car;
    Colour = car.Colour;
    MPG = car.MPG;
    Model = car.Model;
    NoOfSheets = car.NoOfSheets;
    Price = car.Price;
    SpecialFeatures = car.SpecialFeatures;

   // controller1 = new TextEditingController(text: widget.car.Colour);
   // Image = widget.Image;


  }

  void showUpdatedToast(){
    Fluttertoast.showToast(
        msg: "Update Successfully!!",
        toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
          title: Text(
              'Car Form'
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.blue,
                      Colors.black
                    ]
                )
            ),
          ),
          leading: GestureDetector(
        onTap: (){Navigator.pop(context, false);},
        child: Icon(
            Icons.arrow_back_ios
        ),)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5,1],
                colors: [Colors.white,Colors.blue[900]]),
          ),
          child: Column(
            children: <Widget>[
              Image.network(car.Image),
              SizedBox(height: 30,),
              //Text(widget.Model, style: TextStyle(fontSize: 22),),


          TextFormField(
            initialValue: car.Colour,
            //controller: controller1,
            decoration: InputDecoration(fillColor: Colors.white, filled: true,contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: 'Color'),
            //decoration: InputDecoration(labelText: 'Color'),

            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16),
            onChanged: (String color){
              this.Colour = color;
            },
          ),


              SizedBox(height: 16,),

              TextFormField(
                initialValue: car.MPG,
                //controller: controller2,
                decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: "MPG"),
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16,),
                onChanged: (String mpg){
                  this.MPG = mpg;
                },
              ),

              SizedBox(height: 16,),

              TextFormField(
                initialValue: car.Model,
                decoration: InputDecoration(fillColor:Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: "Model"),
               // initialValue: widget.Model,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16, ),
                onChanged: (String model){
                  this.Model = model;
                },
              ),

              SizedBox(height: 16,),
              TextFormField(
                initialValue: car.NoOfSheets,
                decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: "Sheets"),
                //initialValue: car.NoOfSheets,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16, ),
                onChanged: (String sheets){
                  this.NoOfSheets = sheets;
                },
              ),

              SizedBox(height: 16,),
              TextFormField(
                initialValue: car.Price,
                decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: "Price"),

                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16, ),
                onChanged: (String price){
                  this.Price = price;
                },
              ),

              SizedBox(height: 16,),

              TextFormField(
                //controller: controller6,
                decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: "Features"),
                initialValue: car.SpecialFeatures,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16, ),
                onChanged: (String features){
                  this.SpecialFeatures = features;
                },
              ),




              RaisedButton(
                color: Colors.blue[900],
                child: Text("Update Details".toUpperCase(),
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: (){

                  api.update(car, Colour, MPG, Model, NoOfSheets, Price, SpecialFeatures);
                  showUpdatedToast();
                  Navigator.pop(context);
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white)
                ),

              )




            ],
          ),),),
    );
  }
}
