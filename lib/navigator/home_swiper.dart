import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiperPage extends StatefulWidget{
  Map arguments;
  HomeSwiperPage({this.arguments});
  @override
  HomeSwiperPageState createState()=>HomeSwiperPageState();

}

class HomeSwiperPageState extends State<HomeSwiperPage>  with AutomaticKeepAliveClientMixin   {
  Map arguments;
  HomeSwiperPageState({this.arguments});
  List imageList = [
    'https://img1.qunarzz.com/sight/p0/201405/14/3dfad2bcd30c40e91a15f8b7296d86a6.jpg_256x160_0246cc9a.jpg',
    "https://imgs.qunarzz.com/vc/24/36/10/3fc94d042ae62de380581d4c98.jpg_92.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 160,
      child: Swiper(
        itemCount: imageList.length,
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Image.network(
              imageList[index],
              fit:BoxFit.fill
          );
        },
        pagination: SwiperPagination(),
      )
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
