import 'package:flutter/material.dart';
import 'package:travel/page/RecorderPage.dart';
import 'package:travel/page/selectImag.dart';
import 'package:travel/page/tabPage.dart';
import '../page/home_page.dart';
import '../page/my_page.dart';
import '../page/search_page.dart';
import '../page/travel_page.dart';

class TabNavigator extends StatefulWidget {
  Map arguments;

  TabNavigator({this.arguments});

  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  var switchColor = Colors.blue;
  var headColor = Colors.grey;
  List<Widget> pageList = [HomePage(), SearchPage(), TravelPage(), MyPage()];
  int currentIndex = 0;
  Map arguments;
  double topY  = 0.0;

  TabNavigatorState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


       // resizeToAvoidBottomInset: false,
      body: IndexedStack(
        //防止页面被重置
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          tabPage(),
          MyApp(),
          selectImag()

        ],
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 20,
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        //底部可以有多个按钮
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            title: Text(
              "首页",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? switchColor : headColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: currentIndex != 1 ? headColor : switchColor,
            ),
            title: Text(
              "搜索",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
              title: Text(
                "旅拍",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              icon: Icon(
                Icons.phone,
                color: currentIndex != 2 ? headColor : switchColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "我的",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              icon: Icon(
                Icons.settings,
                color: currentIndex != 3 ? headColor : switchColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "录音",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              icon: Icon(
                Icons.audiotrack,
                color: currentIndex != 3 ? headColor : switchColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "拍照",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              icon: Icon(
                Icons.audiotrack,
                color: currentIndex != 3 ? headColor : switchColor,
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
