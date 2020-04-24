import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toyota_app/Animations/fadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:toyota_app/API/AuthenticationService.dart';
import 'package:toyota_app/UI/AdminCarListPage.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{


  @override
  void initState(){
    super.initState();

  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void showUpdatedToast(){
    Fluttertoast.showToast(
      msg: "Registered Successfully!!",
      toastLength: Toast.LENGTH_LONG,
    );
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
                    controller: emailController,
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
                controller: passwordController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "Password"
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
                      if(passwordController.text.length == 0 && emailController.text.length == 0){
                        return Alert(
                            context: context,
                            title: "Alert!!!",
                            desc: "Please enter email and password!!!",
                            buttons: [
                              DialogButton(child: Text("OK",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20),),
                                onPressed: () {
                                  Navigator.pop(context);
                                },)
                            ]

                        ).show();
                      }else {
                        if (passwordController.text.length <= 6) {
                          return Alert(
                              context: context,
                              title: "Alert!!!",
                              desc: "Password must be more than 6 characters",
                              buttons: [
                                DialogButton(child: Text("OK",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },)
                              ]

                          ).show();
                        } else {
                          signUpWithEmailPasswword();
                          showUpdatedToast();
                          Navigator.pop(context);
                        }
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

  void signUpWithEmailPasswword()
  async {
    FirebaseUser user;
    try {
      user = (await mAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)) as FirebaseUser;
    }catch(e){
      print(e.toString());
    }
  }
}