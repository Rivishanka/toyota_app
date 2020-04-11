import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> loginWithEmail(
     String email,
     String password) async{

    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password);

      FirebaseUser user = result.user;
      if(user != null)
        return true;
      else
        return false;
    } catch(e){
      return false;
    }
  }

   Future<bool> signUpWithEmail(
     String email,
     String password) async{

    try{
      AuthResult authResult;
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      FirebaseUser newUser = authResult.user;
      if(newUser != null)
        return true;
      else
        return false;
    } catch(e){
      return false;
    }
  }
}