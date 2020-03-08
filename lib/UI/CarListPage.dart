import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyota_app/UI/MoreDetailsPage.dart';


class CarListPage extends StatefulWidget{
  @override
  State createState() => CarListPageState();
}

class CarListPageState extends State<CarListPage>{

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>print("Timeout"));

  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomPadding: false, //when padding overload

        appBar: AppBar(
          title: Text("Toyota"),
          backgroundColor: Colors.indigo,
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
                onTap: () {},
                child: Icon(
                    Icons.search
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
                      return new Padding(
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
                              new ClipRRect(
                                child: new Image.network(
                                  '${mypost['Image']}',
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: new Radius.circular(16.0),
                                  topRight: new Radius.circular(16.0),
                                ),
                              ),
                              new Padding(
                                padding: new EdgeInsets.all(16.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text('${mypost['Model']}',
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                    new SizedBox(height: 16.0),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text('${mypost['Price']}',
                                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                                        new OutlineButton(
                                          child: Text('Details',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'
                                            )
                                        ),
                                          color: Colors.purple,
                                          splashColor: Colors.blue,
                                          borderSide: BorderSide(color: Colors.blueAccent),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => MoreDetailsPage()));
                                          },),
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
        )
    );
  }

}