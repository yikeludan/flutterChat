import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  EdgeInsets padding = MediaQuery.of(context).padding;  // This widget is the root of your application.

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page')
     /* Container(
        padding: EdgeInsets.fromLTRB(0, padding.top, 0, padding.bottom),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("顶部"),
              Text("底部")
            ],
          ),


      )*/
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:TabNavigator()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
