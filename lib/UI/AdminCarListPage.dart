import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:toyota_app/UI/CarDetails.dart';
import 'package:toyota_app/UI/CarForm.dart';
//import 'package:toyota_app/UI/MoreDetailsPage.dart';
import 'package:toyota_app/Notifier/CarNotifier.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:toyota_app/UI/PopularityOfVehicles.dart';
import 'package:toyota_app/UI/UpdateCarDetails.dart';

class AdminCarListPage extends StatefulWidget{
  @override
  State createState() => AdminCarListPageState();
}

class AdminCarListPageState extends State<AdminCarListPage>{

  VehicleAPI api = new VehicleAPI();
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>print("Timeout"));

  }

  Widget alertBox(Car car){
    return AlertDialog(
      title: Text("Do you want to delete this vehicle?"),
      actions: <Widget>[
        FlatButton(child: Text('No'),
          onPressed: (){
            //Navigator.of(this.context, rootNavigator: true).pop();
          },),
        FlatButton(child: Text('Yes'),
          onPressed: (){
            //uploadImage();
            api.delete(car);
            Navigator.of(this.context).push(
                MaterialPageRoute(builder: (context) => AdminCarListPage())
            );

          },
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomPadding: false, //when padding overload

        appBar: AppBar(
          title: Text("Toyota"),
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
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(this.context).push(
                      MaterialPageRoute(builder: (context) => PopularityVehicles())
                  );
                },
                child: Icon(
                    Icons.favorite_border
                ),
              ),
            )
          ],

          actionsIconTheme: IconThemeData(
              color: Colors.white,
              size: 30.0
          ),
        ),

        body: StreamBuilder(
            stream: Firestore.instance.collection('post').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                const Text('Please wait...');
              }

              else{
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot mypost = snapshot.data.documents[index];
                      final car = Car.fromSnapshot(mypost);
                      return new Padding(
                        key: ValueKey(car.Model),
                        padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: new Card(
                          elevation: 12.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(16.0),
                          ),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              new GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoreCarDetailsPage(car: car)));
                                },
                                child: new Image.network(
                                  '${mypost['Image']}',
                                  fit: BoxFit.fill,

                                ),
                              ),
                              new Padding(
                                padding: new EdgeInsets.all(16.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text('${mypost['Model']}',
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: 'Quintessential'),
                                    ),
                                    new SizedBox(height: 16.0),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text('${mypost['Price']}',
                                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blueGrey,),),


                                        IconButton(
                                          color: Colors.yellow,
                                          icon: Icon(Icons.mode_edit),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCarDetails(car: car)));
                                          },
                                        ),


                                        IconButton(
                                          color: Colors.red,
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            showDialog(context: context,
                                                builder: (BuildContext context) => alertBox(car));
                                            //api.delete(car);
                                          },
                                        ),


//                                        new OutlineButton(
//                                          child: Text('Update',
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontWeight: FontWeight.bold,
//                                                  fontFamily: 'Montserrat'
//                                              )
//                                          ),
//                                          color: Colors.purple,
//                                          splashColor: Colors.blue,
//                                          borderSide: BorderSide(color: Colors.blueAccent),
//                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//                                          onPressed: (){
//                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCarDetails(car: car)));
//                                          },),

//                                        new OutlineButton(
//                                          child: Text('Delete',
//                                              style: TextStyle(
//                                                 // backgroundColor: Colors.red,
//                                                  color: Colors.red,
//                                                  fontWeight: FontWeight.bold,
//                                                  fontFamily: 'Montserrat'
//                                              )
//                                          ),
//                                          //color: Colors.purple,
//                                          //splashColor: Colors.blue,
//                                          borderSide: BorderSide(color: Colors.redAccent),
//                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//                                          onPressed: (){
//                                            api.delete(car);
//                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MoreDetailsPage()));
//                                          },),


                                      ],
                                    )
                                  ],
                                ),

                              )
                            ],
                          ),
                        ),

                      );
                    }
                );
              }
            }
        ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        onPressed: (){
          //carNotifier.currentCar = null;
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CarForm())
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}