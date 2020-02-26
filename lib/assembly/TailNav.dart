import 'package:flutter/material.dart';
import 'package:travel/model/GridNavModel.dart';
import 'package:travel/model/HotelModel.dart';
class TailNav extends StatefulWidget{
  Map arguments;
  int index = 0;
  GridNavModel gridNav;
  HotelModel commModel;
  TailNav({this.arguments,this.gridNav,this.commModel,this.index});
  @override
  TailNavState createState()=>TailNavState();

}


class TailNavState extends State<TailNav>  with AutomaticKeepAliveClientMixin  {
  Map arguments;
  TailNavState({this.arguments});
  double left = 0.0;
  double speed = 0.5;
  double Dyspeed = 0.1;
  bool flag = false;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        height: 400,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[

            Expanded(
              flex: 1,
              child:Stack(
                children: <Widget>[
                  Positioned(
                    left: left,
                    child: GestureDetector(
                       onPanUpdate: (tapInfo){
                             setState(() {
                               print(tapInfo.delta.dx);
                              /* if(left>10&&left<50){
                                 if(!flag){
                                   speed-=0.1;
                                   flag = true;
                                 }
                               }
                               if(left>50&&left<100){
                                 if(flag){
                                   speed-=0.1;
                                   flag = false;
                                 }
                               }
                               if(left>100&&left<150){
                                 if(!flag){
                                   speed-=0.1;
                                   flag = true;
                                 }
                               }
                               if(left>150&&left<200){
                                 if(flag){
                                   speed-=0.1;
                                   flag = false;
                                 }
                               }
                               if(left>200){
                                 if(!flag){
                                   speed-=0.1;
                                   flag = true;
                                 }
                               }*/
                               left +=(tapInfo.delta.dx*speed);
                               //speed = speed - Dyspeed;
                             });
                       },
                       child:Container(
                         width: 150,
                         padding: EdgeInsets.all(5),
                         child: Image.network("https://www.devio.org/io/flutter_app/img/sales_box_huodong.png",fit: BoxFit.fill,),
                       ),
                    )

                  )
                ],
              )


            ),
            Expanded(
              flex: 4,
              child:Container(
                 child: Row(
                   children: <Widget>[

                     Expanded(
                       flex: 1,
                       child:Container(
                         child: Image.network("https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png",fit: BoxFit.fill,),
                       ),
                     ),
                     Expanded(
                       flex: 1,
                       child:Container(
                         child: Image.network("https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg",fit: BoxFit.fill,),
                       ),
                     )
                   ],
                 ),
              ),

            ),
            Expanded(
              flex: 5,
              child:Container(
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child:Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.network("https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg",fit: BoxFit.fill,),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.network("https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg",fit: BoxFit.fill,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.network("https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg",fit: BoxFit.fill,),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.network("https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg",fit: BoxFit.fill,),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ),

          ],
      ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;




}