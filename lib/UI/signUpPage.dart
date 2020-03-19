import 'package:flutter/material.dart';
import 'package:toyota_app/Animations/fadeAnimation.dart';



class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  //Colors.blue[900],
                  Colors.cyan[400],
                  //Colors.blue[700],
                  Colors.lightBlue[800],
                  //Colors.purple,
                  Colors.blue[900],
                  Colors.white,
                  //Colors.grey[700]
                ]
            )
        ),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


FadeAnimationScreen(1.5, Container(

    child: Column(
      children: <Widget>[
        Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold), )
      ],
    ),
  ),





),


            //FadeAnimationScreen(1.2, Text("Login",
            // style: TextStyle(color: Colors.white, fontSize: 40,),)),
            SizedBox(height: 30,),
            FadeAnimationScreen(1.5,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8),),
                        hintText: "   Email or Phone number"
                    ),
                  ),
                )),
            SizedBox(height: 10.0),
            FadeAnimationScreen(1.5, Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "   Password"
                ),
              ),
            )),

            SizedBox(height: 10.0),
            FadeAnimationScreen(1.5, Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "   Confirm Password"
                ),
              ),
            )),


            SizedBox(height: 40,),
            FadeAnimationScreen(1.8, Center(
              child: Container(
                width: 250,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          //Colors.blue[900],
                          Colors.black,
                          Colors.blue[900],
                          Colors.lightBlue[800],

                        ]
                    )

                ),
                child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white.withOpacity(.7)),)),
              ),
            )),



          ],
        ),
      ),

    );
  }
}



class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ImageIcon(new AssetImage('assets/tt.png'),
        color: Colors.white,size: 150.2);
  }
}