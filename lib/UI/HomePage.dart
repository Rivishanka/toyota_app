import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:toyota_app/UI/CarListPage.dart';

import 'MoreDetailsPage.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => HomePageState();

}

class HomePageState extends State<HomePage>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>print("Timeout"));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false, //when padding overload
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[
          Container(
            decoration: new BoxDecoration(image: new DecorationImage(
                image: AssetImage('assets/img/background.jpg'), fit: BoxFit.fill)),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 110.0, 0.0, 0.0),
                      child: new Container(
                        child: PictureWidget(),
                      )
                    ),
//                    Container(
//                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                      child: Text(
//                        'Toyota',
//                        style: TextStyle(
//                            color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),


                    //add button
                    SizedBox(height: 90.0),
                    Container(
                      height: 50.0,
                      width: 300.0,
                      child: OutlineButton(
                        child: Text('SignUp',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            )
                        ),
                        color: Colors.purple,
                        splashColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CarListPage()));
                        },),
                    ),
                    Container(
                      child: Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 90.0, right: 15.0),
                              child: Divider(
                                color: Colors.white,
                                height: 50,
                              )),
                        ),

                        Text("OR SKIP",style: TextStyle(color: Colors.white),),

                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 15.0, right: 90.0),
                              child: Divider(
                                color: Colors.white,
                                height: 50,
                              )),
                        ),
                      ]),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 50.0,
                      width: 300.0,
                      child: OutlineButton(
                        child: Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            )
                        ),
                        color: Colors.purple,
                        splashColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoreDetailsPage()));
                      },),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ImageIcon(new AssetImage('assets/img/toyotalogo.png'),
        color: Colors.white,size: 150.2);
  }
}