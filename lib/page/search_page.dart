import 'package:flutter/material.dart';
import 'package:travel/dao/HomeDao.dart';
import 'package:travel/model/SearchCommModel.dart';
import 'package:travel/model/SearchModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


//https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=%E9%95%BF%E5%9F%8E
class SearchPage extends StatefulWidget{
  Map arguments;
  SearchPage({this.arguments});
  @override
  SearchPageState createState()=>SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Map arguments;
  SearchPageState({this.arguments});
  SearchModel getSearchModel;
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  loadDao(String text) async {
    try {
      if(text == null|| text == ''){
        setState(() {
          getSearchModel = null;
        });
        return;
      }
      SearchModel searchModel = await HomeDao.fetchSeach(text);
      print(searchTextController);

      setState(() {
        getSearchModel = searchModel;
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> getList(SearchModel searchModel){
    List<Widget> items = [];
    if(searchModel == null||searchModel.data.length == 0){
      items.add(Container());
      return items;
    }

    searchModel.data.forEach((model){
      items.add(item(model));
    });
    return items == null?null:items;
  }

  Widget item(SearchCommModel searchCommModel){
    return Container(
      height: 50,
      child: Row(
        children: <Widget>[
          Container(
               child: Icon(
                 Icons.search,
                 color: Colors.blue,
               ),
             ),
          Container(
            child:Text(
                searchCommModel.word.length>12?searchCommModel.word.substring(0,10):searchCommModel.word,
                style: TextStyle(
                  fontSize: 15
                ),

            )
          ),
          Container(
              child:Text(
                  searchCommModel.type =='ticket'?"票价:${searchCommModel.price}":""
              )
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
          FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                 margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: ListView(
                    children: getList(getSearchModel)
                  )
              )
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              height: 30,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xffDCDCDC")),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.grey
                        ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: TextField(
                        controller: searchTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: -20),

                        ),
                        onChanged: (text){

                          loadDao(text);
                        },

                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(
                          Icons.record_voice_over,
                          color: Colors.blue
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        "搜索",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18
                        ),
                      )
                    ),
                  )

                ],
              ),
          )

           // width: 550,
          ),



        ],

    );

  }


}
