import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:travel/assembly/DownLoadNav.dart';
import 'package:travel/assembly/GridNav.dart';
import 'package:travel/assembly/LocalStorage.dart';
import 'package:travel/assembly/MiddleNav.dart';
import 'package:travel/assembly/MiddleNavTwo.dart';
import 'package:travel/assembly/TailNav.dart';
import 'package:travel/dao/HomeDao.dart';
import 'package:travel/model/HomeModel.dart';
import '../navigator/home_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://www.devio.org/io/flutter_app/json/home_page.json
class HomePage extends StatefulWidget {
  Map arguments;

  HomePage({this.arguments});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  Map arguments;
  HomeModel getHomeModel = null;

  HomePageState({this.arguments});

  int loadIndex = 0;
  int downLoadIndex = 0;

  String resultStr = '';
  List imageList = [
    'https://img1.qunarzz.com/sight/p0/201405/14/3dfad2bcd30c40e91a15f8b7296d86a6.jpg_256x160_0246cc9a.jpg',
    "https://imgs.qunarzz.com/vc/24/36/10/3fc94d042ae62de380581d4c98.jpg_92.jpg"
  ];
  double appBarAlpha = 0;

  @override
  void initState() {
    super.initState();
    loadHomeDao();
  }

  onScroll(offset, downoffset) {
    double alpha = offset / 100;
    if (downoffset == 0.0) {
      print("到di了");
    }
    //
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
     // appBarAlpha = alpha;
    });
    if (downoffset == 0.0) {

      downLoadIndex = 0;
    }
  }

  loadHomeDao() async {
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        getHomeModel = homeModel;
        loadIndex = 1;
      });
    } catch (e) {
      print(e);
    }
  }
  Future<Null> _onRefresh() async {
      setState(() {
        loadIndex = 0;
      });
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        getHomeModel = homeModel;
        loadIndex = 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return loadIndex == 0 ? getLoadIng(context) : getContent(context);
  }

  Widget getLoadIng(BuildContext context) {
    return Center(
      child: Text("加载中..."),
    );
  }

  Widget getContent(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh, // 添加onRefresh方法
        child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                //监听第0个
                onScroll(scrollNotification.metrics.pixels,
                    scrollNotification.metrics.extentAfter);
              }
            },
          child: ListView(
            padding: EdgeInsets.all(0), //使顶部状态栏变成默认沉浸式的
            children: <Widget>[
              HomeSwiperPage(),
              GridNav(localNavList: getHomeModel.localNavList),
              MiddleNav(commModel: getHomeModel.gridNav.hotel, index: 0),
              MiddleNav(commModel: getHomeModel.gridNav.travel, index: 1),
              MiddleNav(commModel: getHomeModel.gridNav.flight, index: 2),
              MiddleNav(commModel: getHomeModel.gridNav.flight, index: 2),
              MiddleNav(commModel: getHomeModel.gridNav.flight, index: 2),
              MiddleNav(commModel: getHomeModel.gridNav.flight, index: 2),
              MiddleNav(commModel: getHomeModel.gridNav.flight, index: 2),

              //MiddleNavTwo(subNavList: getHomeModel.subNavList),
              TailNav(),
              TailNav(),
              TailNav(),
              TailNav(),
              TailNav(),
              TailNav(),

              DownLoadNav(downLoadIndex: downLoadIndex),
            ],
          )
        )

      );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
