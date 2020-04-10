import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

// API functions

class VehicleAPI {

  String collectionName = "post";


//  uploadVehicleAndImage(Car car, File localFile) async {
//    if (localFile != null) {
//      print("Uploading image");
//
//      var fileExtension = path.extension(localFile.path);
//      var uuid = Uuid().v4();
//
//      final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref()
//          .child('Toyota/$uuid$fileExtension');
//
//      await firebaseStorageRef
//          .putFile(localFile)
//          .onComplete
//          .catchError(
//              (onError) {
//            return false;
//          });
//
//      String url = await firebaseStorageRef.getDownloadURL();
//      print("download url: $url");
//      uploadVehicle(car, imageURL: url);
//    } else {
//      print("Skip image");
//    }
//  }
//
//  uploadVehicle(Car car, {String imageURL}) async {
//    CollectionReference carRef = Firestore.instance.collection('post');
//
//    if (imageURL != null) {
//     // car.Image = imageURL;
//    }
//
//    DocumentReference documentRef = await carRef.add(car.toMap());
//
//    print('added');
//    await documentRef.setData(car.toMap(), merge: true);
//  }



  addCar(Car user){
    //User user = User(name: controller.text);

    try{
      Firestore.instance.runTransaction(
            (Transaction transaction) async {
          await Firestore.instance
              .collection(collectionName)
              .document()
              .setData(user.toJson());
        },
      );
    }catch(e){
      print(e.toString());
    }
  }


  delete(Car car){
    Firestore.instance.runTransaction(
          (Transaction transaction) async {
        await transaction.delete(car.reference);
      },
    );
  }



}