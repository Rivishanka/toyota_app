import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toyota_app/Models/CarPopularity.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PopularityVehicles extends StatefulWidget{
  PopularityVehicles({Key key}) : super(key: key);

  _PopularityVehiclesState createState() => _PopularityVehiclesState();
}

class _PopularityVehiclesState extends State<PopularityVehicles> {
  List<charts.Series<CarPopularity, String>> _seriesPieData;
  List<CarPopularity> mydata;

  _generateData(myData) {
    _seriesPieData = List<charts.Series<CarPopularity, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (CarPopularity popularity, _) => popularity.taskDetails,
        measureFn: (CarPopularity popularity, _) => popularity.taskVal,
        colorFn: (CarPopularity popularity, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(popularity.colorVal))),
        id: 'popularity',
        data: mydata,
        labelAccessorFn: (CarPopularity row, _) => "${row.taskVal}",
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Toyota'),
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
          ),
        ),
      ),
      body: Container(

        padding: EdgeInsets.all(30),

        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/newbackground.jpg"),fit:BoxFit.fill
            )
        ),
        child: _buildBody(context),
      )
    );
  }

  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('popularity').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return LinearProgressIndicator();
        } else{
          List<CarPopularity> popularity = snapshot.data.documents
              .map((documentSnapshot) => CarPopularity.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, popularity);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<CarPopularity> popularityData) {
    mydata = popularityData;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Vehicles Popularity',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                behaviors: [
                  new charts.DatumLegend(
                    outsideJustification:
                      charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: 2,
                    cellPadding:
                      new EdgeInsets.only(right: 6.0, bottom: 4.0, top: 8.0),
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.white,
                      fontWeight: 'Georgia',
                      fontSize: 18
                    ),
                  )
                ],
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 100,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.inside
                    )

                  ]
                ),),

              )
            ],
          ),
        ),
      ),
    );
  }

}