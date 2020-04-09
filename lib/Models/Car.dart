import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  String Colour;
  String Image;
  String MPG;
  String Model;
  String NoOfSheets;
  String Price;
  String SpecialFeatures;
  DocumentReference reference;

  Car({this.Colour, this.Image, this.MPG, this.Model, this.NoOfSheets, this.Price, this.SpecialFeatures});

  Car.fromMap(Map<String, dynamic> map, {this.reference}){
    Colour = map['Colour'];
   // Image = map['Image'];
    MPG = map['MPG'];
    Model = map['Model'];
    NoOfSheets = map['NoOfSheets'];
    Price = map['Price'];
    SpecialFeatures = map['SpecialFeatures'];
    Image = map['Image'];
   // reference = map['reference'];
    //Pri//  Map<String, dynamic> toMap(){
    ////    return{
    ////      'Colour': Colour,
    ////     // 'Image': Image,
    ////      //'MPG': MPG,
    ////      //'Model': Model,
    ////      //'NoOfSheets': NoOfSheets,
    ////      //'Price': Price,
    ////      //'SpecialFeatures': SpecialFeatures
    ////    };
    ////  }ce = map['Price'];
    //SpecialFeatures = map['SpecialFeatures'];
  }



  Car.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {'Colour': Colour, 'Image': Image, 'MPG': MPG, 'Model': Model, 'NoOfSheets': NoOfSheets, 'Price': Price, 'SpecialFeatures': SpecialFeatures};
  }

}