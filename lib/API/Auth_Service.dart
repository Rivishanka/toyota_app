import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChange => _firebaseAuth.onAuthStateChanged.map(
      (FirebaseUser user) => user?.uid,
  );

  Future<String> createUserWithEmaiAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );

    //Update username
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
//    await currentUser.updateProfile(userUpdateInfo);

  }

}