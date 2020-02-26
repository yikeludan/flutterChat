import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/*void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  https://www.devio.org/io/flutter_app/json/travel_page.json
}*/

class tabPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColorBrightness: Brightness.dark,
          platform: TargetPlatform.iOS),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class TabTitle {
  String title;
  int id;
  TabTitle(this.title, this.id);
}

class HomeState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;
  ScrollController _scrollController = new ScrollController();


  @override
  void initState() {
    super.initState();
    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {//TabBar的监听
      if (mTabController.indexIsChanging) {//判断TabBar是否切换
        print(mTabController.index);
        onPageChange(mTabController.index, p: mPageController);
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("dibu");
      }
    });
  }

  initTabData() {
    tabList = [
      new TabTitle('推荐', 10),
      new TabTitle('热点', 0),
      new TabTitle('社会', 1),
      new TabTitle('娱乐', 2),
      new TabTitle('体育', 3),
      new TabTitle('美文', 4),
      new TabTitle('科技', 5),
      new TabTitle('财经', 6),
      new TabTitle('时尚', 7)
    ];
  }
  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {//判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);//等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index);//切换Tabbar
    }
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
    _scrollController.dispose();
  }
  Future<Null> _onRefresh() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            color: new Color(0xfff4f5f6),
            height: 40.0,
            child: TabBar(
              isScrollable: true,
              //是否可以滚动
              controller: mTabController,
              indicatorColor: Colors.green,//选中时下划线颜色,如果使用了indicator这里设置无效
              indicatorWeight: 2.5,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: tabList.map((item) {
                return Tab(
                  text: item.title,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: tabList.length,
              onPageChanged: (index) {
                if (isPageCanChanged) {//由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                  onPageChange(index);
                }
              },
              controller: mPageController,
              itemBuilder: (BuildContext context, int index) {
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child:  Container(
                    padding: EdgeInsets.all(0),
                    child: StaggeredGridView.countBuilder(
                      controller: _scrollController,
                      crossAxisCount: 4,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) => new Container(
                          color: Colors.green,
                          child: new Center(
                            child: new CircleAvatar(
                              backgroundColor: Colors.white,
                              child: new Text('$index'),
                            ),
                          )),
                      staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 2 : 1),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                  )
                );

              },
            ),
          )
        ],
      ),
    );
  }
}