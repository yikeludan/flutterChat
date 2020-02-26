import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  Map arguments;
  MyPage({this.arguments});
  @override
  MyPageState createState()=>MyPageState();

}

class MyPageState extends State<MyPage> {
  Map arguments;
  MyPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("我的"),
    );
  }

}
