import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel/model/CommModel.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const WEB_URL=['https://m.ctrip.com','https://m.ctrip.com/html5','https://m.ctrip.com/html5/'];
class WebWiew extends StatefulWidget{
  Map arguments;
  String url;
  String statusBarColor;
  String title;
  bool hideAppBar;
  bool backForbid;
  WebWiew({this.arguments,this.url,this.statusBarColor,this.title,this.hideAppBar,this.backForbid = false});

  @override
  WebWiewState createState()=>WebWiewState();

}


class WebWiewState extends State<WebWiew> {
  Map arguments;
  bool exit = false;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> onUrlChanged;
  StreamSubscription<WebViewStateChanged> onStateChanged;
  StreamSubscription<WebViewHttpError> onHttpError;

  WebWiewState({this.arguments});

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url){

    });
    onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state){
      switch(state.type){
        case WebViewState.startLoad:
           if(isMainUrl(state.url)&&!exit){
             if(widget.backForbid){
               flutterWebviewPlugin.launch(widget.url);
             }else{
               Navigator.pop(context);
               exit = true;
             }
           }
           break;
        default:
           break;
      }
    });
    onHttpError = flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error){
        print(error);
    });
  }

  isMainUrl(String url){
    bool flag = false;
    for(String value in WEB_URL){
      if(url?.endsWith(value)??false){
        flag = true;
        break;
      }
    }
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColor = widget.statusBarColor??'ffffff';
    Color backButtonColor;
    if(statusBarColor == 'ffffff'){
      backButtonColor = Colors.black;
    }else{
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
          children: <Widget>[
            appBar(Color(int.parse("0xff"+statusBarColor)),backButtonColor),
            Expanded(
              child: WebviewScaffold(url:widget.url,
              withZoom: true,
                withLocalStorage: true,
                hidden: true,
                initialChild:Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("加载中。。。"),
                  ),
                )
              ),
            )
          ],
      ),
    );
  }

  appBar(Color backgroundColor,Color backButtonColor){
      if(widget.hideAppBar??false){
        return Container(
          color: backgroundColor,
          height: 30,
        );
      }
      return Container(
        child: FractionallySizedBox(//将Container的宽高设置为设备的1。
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.close,
                    color: backButtonColor,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title??'',
                    style: TextStyle(
                      color: backgroundColor,
                      fontSize: 20

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    onUrlChanged.cancel();
    onStateChanged.cancel();
    onHttpError.cancel();
    flutterWebviewPlugin.dispose();


  }



}