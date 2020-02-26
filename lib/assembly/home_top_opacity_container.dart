import 'package:flutter/material.dart';

class HomeTopOpacityContainer extends StatefulWidget{
  Map arguments;
  double appBarAlpha = 0;
  HomeTopOpacityContainer({this.arguments,this.appBarAlpha});
  @override
  HomeTopOpacityContainerState createState()=>HomeTopOpacityContainerState(appBarAlpha:appBarAlpha);

}


class HomeTopOpacityContainerState extends State<HomeTopOpacityContainer> {
  Map arguments;
  double appBarAlpha = 0;
  HomeTopOpacityContainerState({this.arguments,this.appBarAlpha});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("appBarAlpha = ${appBarAlpha}");
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Padding(
              padding: EdgeInsets.only(top:10),
              child: Text("首页"),

            )
        ),
      ),
    );

  }

}