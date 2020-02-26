import 'package:flutter/material.dart';
import 'package:travel/model/CommModel.dart';
import 'package:travel/model/GridNavModel.dart';
import 'package:travel/model/HotelModel.dart';
class MiddleNavTwo extends StatefulWidget{
  Map arguments;
  int index = 0;
  GridNavModel gridNav;
  HotelModel commModel;
  List<CommModel> subNavList;
  MiddleNavTwo({this.arguments,this.gridNav,this.commModel,this.subNavList});
  @override
  MiddleNavTwoState createState()=>MiddleNavTwoState();

}


class MiddleNavTwoState extends State<MiddleNavTwo>  with AutomaticKeepAliveClientMixin  {
  Map arguments;


  @override
  void initState() {
    super.initState();

  }
  List<Widget> getList(){
    List<Widget> list =[];
    widget.subNavList.forEach((value){
      list.add(item(value));
    });
    return list.toList();
  }
  Widget item(CommModel commModel){
    return  Container(
      height: 60,
      width: 60,
      child: Column(
        children: <Widget>[
          Container(
            height: 25,
            child: Image.network(commModel.icon,fit: BoxFit.fill,),
          ),
          Container(
            height: 30,
            child: Text(commModel.title,style: TextStyle(fontSize: 12),),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        height: 140,
        margin: EdgeInsets.only(top: 10),
        child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(4.0),
          children: getList()
        ),

      ),
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}