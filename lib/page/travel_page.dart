import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget{
  Map arguments;
  TravelPage({this.arguments});
  @override
  TravelPageState createState()=>TravelPageState();

}

class TravelPageState extends State<TravelPage> {
  Map arguments;
  TravelPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("旅拍"),
    );
  }

}
