import 'package:flutter/material.dart';
import 'package:travel/model/GridNavModel.dart';
import 'package:travel/model/HotelModel.dart';
class MiddleNav extends StatefulWidget{
  Map arguments;
  int index = 0;
  GridNavModel gridNav;
  HotelModel commModel;
  MiddleNav({this.arguments,this.gridNav,this.commModel,this.index});
  @override
  MiddleNavState createState()=>MiddleNavState();

}


class MiddleNavState extends State<MiddleNav>  with AutomaticKeepAliveClientMixin  {
  Map arguments;
  MiddleNavState({this.arguments});
  String item1Color_1 = "";
  String item1Color_2 = "";
  String item2Color_1 = "";
  String item2Color_2 = "";

  @override
  void initState() {
    super.initState();
    if(widget.index == 0){
      widget.commModel.startColor = 'DC143C';
      widget.commModel.endColor = 'fa5956';
      setState(() {
        item1Color_1  = "FF4500";
        item1Color_2 =  "FF6347";
        item2Color_1 = "fa5956";
        item2Color_2 = "fa9b4d";
      });
    }
    if(widget.index == 1){
      widget.commModel.startColor = '1E90FF';
      widget.commModel.endColor = '87CEFA';
      setState(() {
        item1Color_1  = "1E90FF";
        item1Color_2 =  "00BFFF";
        item2Color_1 = "1E90FF";
        item2Color_2 = "00BFFF";
      });
    }
    if(widget.index == 2){
      widget.commModel.startColor = '32CD32';
      widget.commModel.endColor = '98FB98';
      setState(() {
        item1Color_1  = "32CD32";
        item1Color_2 =  "98FB98";
        item2Color_1 = "32CD32";
        item2Color_2 = "98FB98";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        height: 110,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),  //设置圆角
                clipBehavior: Clip.antiAlias,//使圆角生效
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(int.parse("0xff"+widget.commModel.startColor)),Color(int.parse("0xff"+widget.commModel.endColor))],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    children: <Widget>[
                      Container(
                         margin: EdgeInsets.only(top: 14),
                         child: Text(widget.commModel.mainItem.title,style: TextStyle(color: Colors.white,fontSize: 13),),
                      ),
                      Container(
                        height: 60,
                        child: Image.network(widget.commModel.mainItem.icon,
                        fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),  //设置圆角
                clipBehavior: Clip.antiAlias,//使圆角生效
                child: Container(

                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(int.parse("0xff"+item1Color_1)),Color(int.parse("0xff"+item1Color_2))],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Center(
                            child: Text(widget.commModel.item1.title,style: TextStyle(fontSize: 13,color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(int.parse("0xff"+item1Color_1)),Color(int.parse("0xff"+item1Color_2))],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                              )),
                          child: Center(
                            child: Text(widget.commModel.item2.title,style: TextStyle(fontSize: 13,color: Colors.white),),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),  //设置圆角
                clipBehavior: Clip.antiAlias,//使圆角生效
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(int.parse("0xff"+item2Color_1)),Color(int.parse("0xff"+item2Color_2))],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                              )),
                          child: Center(
                            child: Text(widget.commModel.item3.title,style: TextStyle(fontSize: 13,color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(int.parse("0xff"+item2Color_1)),Color(int.parse("0xff"+item2Color_2))],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                              )),
                          child: Center(
                            child: Text(widget.commModel.item4.title,style: TextStyle(fontSize: 13,color: Colors.white),),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      )
    );

  }


  List<Widget> getExpandedS(GridNavModel gridNav){
        List<Widget> list =[];

        return list.toList();
  }

  Widget getExpanded(HotelModel commModel){}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



}