
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:io/ansi.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:toyota_app/Notifier/CarNotifier.dart';
import 'package:path/path.dart' as path;
import 'package:toyota_app/UI/AdminCarListPage.dart';
import 'package:toyota_app/UI/PopularityOfVehicles.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:toyota_app/API/VehicleAPI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';


// This file is for adding the vehicle details from the Admin level

class CarForm extends StatefulWidget {

  CarForm({Key key}) : super(key: key);

  @override
  _CarFormState createState() => _CarFormState();
}
class _CarFormState extends State<CarForm>{
  final _formKey = GlobalKey<FormState>();
  VehicleAPI api = new VehicleAPI();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

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
              style: TextStyle(color: Colors.white, fontSize: 18),
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

    Car user = Car(Colour: controller1.text, Image: url, MPG: controller2.text, Model: controller3.text, NoOfSheets: controller4.text, Price: controller5.text, SpecialFeatures: controller6.text);
    api.addCar(user);


    controller1.text = '';
    controller2.text = '';
    controller3.text = '';
    controller4.text = '';
    controller5.text = '';
    controller6.text = '';
  }

  void showToast(){
    Fluttertoast.showToast(
        msg: "The vehicle is successfully added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0
    );
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true,contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: 'Color'),
      //decoration: InputDecoration(labelText: 'Color'),
      //initialValue: _curretCar.Colour,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true,contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: 'MPG',),
      //decoration: InputDecoration(labelText: 'MPG'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true,contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: 'Model',),
      //decoration: InputDecoration(labelText: 'Model'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true,contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),labelText: 'No of Sheets',),
     // decoration: InputDecoration(labelText: 'No of Sheets'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),), labelText: 'Price'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16,),
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
      decoration: InputDecoration(fillColor: Colors.white, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ), labelText: 'Special Features'),
      //decoration: InputDecoration(labelText: 'Special Features'),
      //initialValue: _curretCar.MPG,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16,),
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

  Widget alertBox(){
    return AlertDialog(
      title: Text("Do you want to add the vehicle?"),
      actions: <Widget>[
        FlatButton(child: Text('No'),
        onPressed: (){
          Navigator.pop(this.context);
        //  Navigator.of(this.context, rootNavigator: true).pop();
        },),
        FlatButton(child: Text('Yes'),
          onPressed: () async{

          uploadImage();
          Navigator.pop(this.context);
          Fluttertoast.showToast(
              msg: "Vehicle is successfully added !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.lightBlueAccent,
              textColor: Colors.white,
              fontSize: 16.0
          );
          await new Future.delayed(const Duration(seconds: 3));
          Navigator.of(this.context).push(
              MaterialPageRoute(builder: (context) => AdminCarListPage())
          );


          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
      child: Scaffold(
      //key: _formKey,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(title: Text('Car Form'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.blue,
                    Colors.black
                  ]
              )
          ),
        ),

      ),
      body: SingleChildScrollView(

        padding: EdgeInsets.all(30),
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5,1],
                colors: [Colors.white,Colors.blue[900]]),
          ),

          //autovalidate: true,
          child:  Column(children: <Widget>[

            _showImage(),
            SizedBox(height: 16,),
//            Text(
//              "Add Vehicle",
//              textAlign: TextAlign.center,
//              style: TextStyle(fontSize: 30),
//            ),
            SizedBox(height: 16,),
            ButtonTheme(
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white)
                ),
                color: Colors.blue[900],
                onPressed: () => getLocalImage(),
                child: Text(
                  'Select Image',
                  style: TextStyle(color: Colors.white, ),
                ),
            ),
            ),
            SizedBox(height: 16,),
            _buildColourField(),
            SizedBox(height: 20,),
            _buildMPGField(),
            SizedBox(height: 20,),
            _buildModelField(),
            SizedBox(height: 20,),
            _buildNoOfSheetsField(),
            SizedBox(height: 20,),
            _buildPriceField(),
            SizedBox(height: 20,),
            _buildSpecialFeaturesField(),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200,
           height: 40,
           child: RaisedButton(


                  child: Text("Add Vehicle".toUpperCase(),
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: (){
                  if(_formKey.currentState.validate()) {
                    showDialog(context: context,
                        builder: (BuildContext context) => alertBox());
                  }
                },
             shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(18.0),
                 side: BorderSide(color: Colors.white)
             ),
             color: Colors.blue[900],

              )),
            ],
            ),


          ],
            ),
      ),
      ),
    )
    );
  }
}