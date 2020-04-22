import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyota_app/Models/Car.dart';
import 'package:bordered_text/bordered_text.dart';



class MoreDetailsPage extends StatelessWidget{

  final Car car;

  const MoreDetailsPage({Key key, @required this.car}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(
        title: Text('Car Form'),
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

            leading: GestureDetector(
    onTap: (){Navigator.pop(context, false);},
              child: Icon(
                  Icons.arrow_back_ios
              ),)),
      body: SingleChildScrollView(
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
          child: Column(
            children: <Widget>[
            Image.network(car.Image),
            SizedBox(height: 40,),
            Text(car.Model, style: TextStyle(fontSize: 22,fontFamily: 'Courgette'),),

            BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.green,

              child: Text(
              "MPG : " +car.MPG,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,


              ),
            ),
          ),


        TextFormField(
          enableInteractiveSelection: false,
          enabled: false,
          decoration: InputDecoration(fillColor: Colors.black, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
          initialValue: "MPG : " +car.MPG,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Courgette'),
        ),

          SizedBox(height: 10,),

          TextFormField(
            enableInteractiveSelection: false,
            enabled: false,
            decoration: InputDecoration(fillColor: Colors.blue[900], filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
            initialValue: "Color : " +car.Colour,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Courgette'),
          ),


          SizedBox(height: 10,),

          TextFormField(
            enableInteractiveSelection: false,
            enabled: false,
            decoration: InputDecoration(
                fillColor: Colors.black, filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),
            initialValue: "Features : " +car.SpecialFeatures,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Courgette'),
          ),

          SizedBox(height: 10,),

          TextFormField(
            enableInteractiveSelection: false,
            enabled: false,
            decoration: InputDecoration(fillColor: Colors.blue[900], filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
            initialValue: "Sheets : " +car.NoOfSheets,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Courgette'),
          ),

          SizedBox(height: 10,),

          TextFormField(
            enableInteractiveSelection: false,
            enabled: false,
            decoration: InputDecoration(fillColor: Colors.black, filled: true, contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
            initialValue: "Price : " +car.Price,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Courgette'),
          ),

          SizedBox(height: 10,),



        ],
      ),),),
    );
  }

}

//class MoreDetailsPageState extends State<MoreDetailsPage>{
//
//  @override
//  void initState(){
//    super.initState();
//    Timer(Duration(seconds: 5), ()=>print("Timeout"));
//
//  }
//
//  Image getImage(photoReference){
//    final baseUrl ="https://firebasestorage.googleapis.com/v0/b/flutter-toyota-app-54048.appspot.com/o/Toyota%2Fsample.jpg?alt=media&token=d1ec0af3-73e0-4483-b066-ef8bcf24f05d";
//    final maxWidth ="1000";
//    final maxHeight ="200";
////    final url = "$baseUrl?maxwidth=$maxWidth&photoreference=$photoReference&key=$";
////    return Image.network(url, fit: BoxFit.cover);
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Center(
//          child: CustomScrollView(
//            slivers: <Widget>[
//              SliverAppBar(
//                title: Text(''),
//                backgroundColor: Colors.blue,
//                expandedHeight: 350.0,
//                flexibleSpace: FlexibleSpaceBar(
////                background: Image.asset('assets/img/chetios.jpg'),
//                  background: Image.network('https://firebasestorage.googleapis.com/v0/b/flutter-toyota-app-54048.appspot.com/o/Toyota%2Fsample.jpg?alt=media&token=d1ec0af3-73e0-4483-b066-ef8bcf24f05d',fit: BoxFit.cover),
//                ),
//              ),
//            ],
//          ),
//
//        )
//
//    );
//  }
//}
//
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//        resizeToAvoidBottomPadding: false, //when padding overload
//
//        appBar: AppBar(
//          title: Text("Toyota"),
//          backgroundColor: Colors.indigo,
//          leading: GestureDetector(
//            onTap: (){Navigator.pop(context, false);},
//            child: Icon(
//                Icons.arrow_back_ios
//            ),
//          ),
//          actions: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(right: 20.0),
//              child: GestureDetector(
//                onTap: () {},
//                child: Icon(
//                    Icons.search
//                ),
//              ),
//            )
//          ],
//
//          actionsIconTheme: IconThemeData(
//              color: Colors.white,
//              size: 30.0
//          ),
//        ),
//
//        body: ListPage(),
//    );
//  }
//}
//
//class ListPage extends StatefulWidget {
//  @override
//  _ListPageState createState() => _ListPageState();
//}
//
//class _ListPageState extends State<ListPage> {
//
//  Future _data;
//
//  Future getPosts() async {
//    var firestore = Firestore.instance;
//
//    QuerySnapshot qn = await firestore.collection("post").getDocuments();
//    return qn.documents;
//  }
//
//  navigateToDetail(DocumentSnapshot post){
//    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _data = getPosts();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: FutureBuilder(
//          future: getPosts(),
//          builder: (_, snapshot){
//
//        if(snapshot.connectionState == ConnectionState.waiting){
//          return Center(
//            child: Text("Loading...."),
//          );
//        }else{
//          return ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (_, index){
//
//                return ListTile(
//                  title: Text(snapshot.data[index].data["Model"]),
//                  onTap: () => navigateToDetail(snapshot.data[index]),
//                );
//
//          });
//        }
//      }),
//    );
//  }
//}
//
//class DetailPage extends StatefulWidget {
//
//  final DocumentSnapshot post;
//
//  DetailPage({this.post});
//
//  @override
//  _DetailPageState createState() => _DetailPageState();
//}
//
//class _DetailPageState extends State<DetailPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.post.data["Model"]),
//      ),
//      body: Container(
//        child: Card(
//          child: ListTile(
//            title: Text(widget.post.data["Model"]),
//            subtitle: Text(widget.post.data["SpecialFeatures"]),
//
//          ),
//        ),
//      ),
//
//    );
//  }
//}
//
