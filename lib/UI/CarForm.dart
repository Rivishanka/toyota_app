
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:toyota_app/Notifier/CarNotifier.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


// This file is for adding the vehicle details

class CarForm extends StatefulWidget {
  CarForm({Key key}) : super(key: key);

  @override
  _CarFormState createState() => _CarFormState();
}
class _CarFormState extends State<CarForm>{
  VehicleAPI api = new VehicleAPI();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Car _curretCar;
  String imageURL;
  File _imageFile;

  @override
  void initState(){
    super.initState();
   // CarNotifier carNotifier = Provider.of<CarNotifier>(context, listen: false);

//    if(carNotifier.currentCar != null){
//      _curretCar = carNotifier.currentCar;
//    }else{
//      _curretCar = new Car();
//    }
  }
  Widget _showImage(){
    if(_imageFile == null && imageURL == null){
      return Text("Image Placeholder");
    }else if(_imageFile != null){
      print('showing from file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onPressed: () => getLocalImage(),
          )
        ],
      );


    }else if(imageURL != null){
      print('showing from uel');
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Image.network(imageURL, fit: BoxFit.cover, height: 250,),
            FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              child: Text(
                'Change Image',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            //  onPressed: () => getLocalImage(),
            )
          ],
      );
    }
  }
  getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  saveVehicle(String url) {
//    if(!_formKey.currentState.validate()){
//      return;
//    }
//    _formKey.currentState.save();
//
//
//    api.uploadVehicleAndImage(_curretCar, _imageFile);
//    print("mpg ${_curretCar.MPG}");

//
//    if ( _imageFile!= null) {
//      print("Uploading image");
//
//      var fileExtension = path.extension(_imageFile.path);
//      var uuid = Uuid().v4();
//
//      final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref()
//          .child('Toyota/$uuid$fileExtension');
//
//      await firebaseStorageRef
//          .putFile(_imageFile)
//          .onComplete
//          .catchError(
//              (onError) {
//            return false;
//          });
//
//      String url = await firebaseStorageRef.getDownloadURL();
//      print("download url: $url");
//    }




    Car user = Car(Colour: controller1.text, Image: url, MPG: controller2.text, Model: controller3.text, NoOfSheets: controller4.text, Price: controller5.text, SpecialFeatures: controller6.text);
    api.addCar(user);

    controller1.text = '';
    controller2.text = '';
    controller3.text = '';
    controller4.text = '';
    controller5.text = '';
    controller6.text = '';
  }

  uploadImage() async{
      print("Uploading image");

      var fileExtension = path.extension(_imageFile.path);
      var uuid = Uuid().v4();

      final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref()
          .child('Toyota/$uuid$fileExtension');

      await firebaseStorageRef
          .putFile(_imageFile)
          .onComplete
          .catchError(
              (onError) {
            return false;
          });

      String url = await firebaseStorageRef.getDownloadURL();
      print("download url: $url");
      saveVehicle(url);
  }

  Widget _buildColourField(){
    return TextFormField(
      controller: controller1,
      decoration: InputDecoration(labelText: 'Color'),
      //initialValue: _curretCar.Colour,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'Color is required';
        }
        return null;
      },
      onSaved: (String value){
      //  _curretCar.Colour = value;
      },
    );
  }

  Widget _buildMPGField(){

    return TextFormField(
      controller: controller2,
      decoration: InputDecoration(labelText: 'MPG'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'MPG is required';
        }
        return null;
      },
      onSaved: (String value){
      //  _curretCar.MPG = value;
      },
    );
  }

  Widget _buildModelField(){
    return TextFormField(
      controller: controller3,
      decoration: InputDecoration(labelText: 'Model'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'Model is required';
        }
        return null;
      },
      onSaved: (String value){
       // _curretCar.Model = value;
      },
    );
  }

  Widget _buildNoOfSheetsField(){
    return TextFormField(
      controller: controller4,
      decoration: InputDecoration(labelText: 'No of Sheets'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'No of Sheets are required';
        }
        return null;
      },
      onSaved: (String value){
      //  _curretCar.NoOfSheets = value;
      },
    );
  }

  Widget _buildPriceField(){
    return TextFormField(
      controller: controller5,
      decoration: InputDecoration(labelText: 'Price'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'Price is required';
        }
        return null;
      },
      onSaved: (String value){
      //  _curretCar.Price = value;
      },
    );
  }

  Widget _buildSpecialFeaturesField(){
    return TextFormField(
      controller: controller6,
      decoration: InputDecoration(labelText: 'Special Features'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value){
        if(value.isEmpty){
          return 'Special Features are required';
        }
        return null;
      },
      onSaved: (String value){
      //  _curretCar.SpecialFeatures = value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Car Form'), backgroundColor: Colors.indigo, leading: GestureDetector(
        onTap: (){Navigator.pop(context, false);},
        child: Icon(
            Icons.arrow_back_ios
        ),
      ),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32 ),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child:  Column(children: <Widget>[
            _showImage(),
            SizedBox(height: 16,),
            Text(
              "Add Vehicle",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16,),
            ButtonTheme(
              child: RaisedButton(

                onPressed: () => getLocalImage(),
                child: Text(
                  'Select Image',
                  style: TextStyle(color: Colors.white),
                ),
            ),
            ),
            _buildColourField(),
            _buildMPGField(),
            _buildModelField(),
            _buildNoOfSheetsField(),
            _buildPriceField(),
            _buildSpecialFeaturesField(),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              ButtonTheme(
                child: RaisedButton(
                onPressed: () => uploadImage(),
                child: Text(
                  'Add Vehicle',
                  style: TextStyle(color: Colors.white, ),
                  textAlign: TextAlign.center,


                ),
              ),)
            ],)
          ],
            ),
      ),
      ),
    );
  }
}