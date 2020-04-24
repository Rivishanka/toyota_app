import 'package:fluttertoast/fluttertoast.dart';
import 'package:toyota_app/Animations/fadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:toyota_app/UI/AdminCarListPage.dart';
import 'package:toyota_app/UI/TestSignUpPage.dart';
import 'package:toyota_app/UI/signUpPage.dart';
import 'package:toyota_app/API/AuthenticationService.dart';

import 'CarListPage.dart';
class LoginTestPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginTestPage>{
  TextEditingController emailController;
  TextEditingController passwordController;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Widget PictureWidget(){
        return new ImageIcon(new AssetImage('assets/img/toyotalogo.png'),
        color: Colors.white,size: 150.2);
  }



  @override
  void initState(){
    super.initState();
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
     // key: _formKey,
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

        child:  isLoading
            ? Center(
          child: CircularProgressIndicator(backgroundColor: Colors.lightBlue,),
        )
        : new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),

            FadeAnimationScreen(1.2,
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: new Container(
                    child: PictureWidget(),
                  ),


                )
            ),
            SizedBox(height: 30,),
            FadeAnimationScreen(1.5,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: TextFormField(
                    onTap: (){ _formKey.currentState.validate();},
                    controller: emailController,
                    validator: (String value){
                      if(value.isEmpty){
                        return "Please provide valid email";
                      }
                    },

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8),),
                        hintText: "Email or Phone number"
                    ),

                   // onTap: (){ _formKey.currentState.validate();},
                  ),
                )),
            SizedBox(height: 10.0),
            FadeAnimationScreen(1.5, Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextFormField(
                controller: passwordController,
                onTap: (){ _formKey.currentState.validate();},
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    hintText: "Password"
                ),

                validator: (String pwd){
                  if(pwd.isEmpty){
                    return "Passwod is empty";
                  }
                },
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
                    child: Center(child: Text("Login", style: TextStyle(color: Colors.white),)),
                    onPressed: () async{
                    //  if(emailController.text.isEmpty || passwordController.text.isEmpty){
                    //    print("Email and password can not be empty");
                    //    return;
                    //  }
                     // else{
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        bool res = await AuthenticationService().loginWithEmail(
                            emailController.text, passwordController.text);

                        if (res) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AdminCarListPage()));
                        }
                        else {
                          setState(() {
                            isLoading = false;
                          });
                          Fluttertoast.showToast(
                              msg: "Please provide valid email and password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          null;
                        }
                        //  }
                      }


                    },
                  )
              ),
            )),
            FadeAnimationScreen(1.5,   SizedBox(height: 50,
              child: Center(
                child: Text("Forget Password ?", style: TextStyle(color: Colors.white,fontFamily: 'Courgette'),),
              ),),
            ),




            SizedBox(height: 20,),
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                  )

              ),
            )),

          ],
        ),
      ),

    )
    );
  }


}
