import 'package:flutter/material.dart';
import 'package:toyota_app/Animations/fadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toyota_app/API/AuthenticationService.dart';
import 'package:toyota_app/UI/AdminCarListPage.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
    TextEditingController controllerName;
    TextEditingController controllerPwd;

    @override
    void initState(){
      super.initState();
      controllerName = TextEditingController(text: "");
      controllerPwd = TextEditingController(text: "");
    }




    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),

        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/img/newbackground.jpg"),fit:BoxFit.fill
        )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


FadeAnimationScreen(1.5, Container(

    child: Column(
      children: <Widget>[
        Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Quintessential'), )
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
                    controller: controllerName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8),),
                        hintText: "Email or Phone number"
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
                controller: controllerPwd,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "Password"
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "Confirm Password"
                ),
              ),
            )),


            SizedBox(height: 40,),
            FadeAnimationScreen(1.8, Center(
              child: Container(
                width: 250.0,
                height: 50.0,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.white)
                  ),
                  color: Colors.blue[900],
                  child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white),)),
                  onPressed: ()async{
                    print(controllerName);
                    print(controllerPwd);
                    bool res = await AuthenticationService().signUpWithEmail(controllerName.text, controllerPwd.text);

                    if(res){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminCarListPage()));
                    }
                    else{
                      null;
                    }
                  },
              ),
            ))
            ),



          ],
        ),
      ),

    );
  }
}