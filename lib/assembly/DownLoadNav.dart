import 'package:flutter/material.dart';
class DownLoadNav extends StatefulWidget{
  Map arguments;
  int downLoadIndex;
  DownLoadNav({this.arguments,this.downLoadIndex});

  @override
  DownLoadNavState createState()=>DownLoadNavState();

}

class DownLoadNavState extends State<DownLoadNav>   {
  Map arguments;
  DownLoadNavState({this.arguments});

  @override
  Widget build(BuildContext context) {
    if(widget.downLoadIndex == 1){
      return Container(
        height: 30,
        child: Center(
          child: Text("加载中"),
        ),
      );
    }
    return Container(
       height: 0,
       child: Center(
         child: Text("加载中"),
       ),
    );
  }

}
