import 'package:flutter/material.dart';
import 'package:travel/assembly/WebWiew.dart';
import 'package:travel/model/CommModel.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:travel/model/GridNavModel.dart';
class GridNav extends StatefulWidget{
  Map arguments;
  double appBarAlpha = 0;
  List<CommModel> localNavList;
  GridNavModel gridNav;
  GridNav({this.arguments,this.appBarAlpha,this.localNavList});

  @override
  GridNavState createState()=>GridNavState(appBarAlpha:appBarAlpha);

}


class GridNavState extends State<GridNav>  with AutomaticKeepAliveClientMixin  {
  Map arguments;
  double appBarAlpha = 0;
  GridNavState({this.arguments,this.appBarAlpha});

  @override
  void initState() {
    super.initState();
    print(widget.localNavList);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 75,
      padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: items(context)
      ),
    );
  }

  List<Widget> items(BuildContext context){
    if(widget.localNavList == null){
      return null;
    }
    List<Widget> items = [];
    widget.localNavList.forEach((model){
      items.add(item(context,model));
    });
    return items.toList();
  }

  Widget item(BuildContext context,CommModel commModel){
        return GestureDetector(
          onTap:(){
             Navigator.push(context,
               MaterialPageRoute(builder:(context)=>
                   WebWiew(url:commModel.url,statusBarColor: commModel.statusBarColor,
                   hideAppBar: commModel.hideAppBar,
                   )
               )
             );
          },
          child: Column(
            children: <Widget>[
              Image.network(
                commModel.icon,
                width: 40,
                height: 40,
              ),
              Text(
                commModel.title,
                style: TextStyle(
                  fontSize: 12
                ),
              )
            ],
          ),
        );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}