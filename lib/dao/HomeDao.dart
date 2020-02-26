import 'package:travel/assembly/LocalStorage.dart';
import 'package:travel/model/HomeModel.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:travel/model/SearchModel.dart';
const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';
const SEARCH_URL = 'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=长城';
const SEARCH_URL_NO_TEXT = 'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';
class HomeDao{
  static Future<HomeModel> fetch() async {
     final response = await http.get(HOME_URL);
     if(response.statusCode == 200){
       Utf8Decoder utf8decoder = new Utf8Decoder();//修复中文乱码
       var result = json.decode(utf8decoder.convert(response.bodyBytes));
       return HomeModel.fromJson(result);
     }else{
       throw Exception("FAIL");
     }
  }

  static Future<SearchModel> fetchSeach(String text) async {
    String SEARCH_URL_NO_TEXTRes = SEARCH_URL_NO_TEXT+text;
    final response = await http.get(SEARCH_URL_NO_TEXTRes);
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = new Utf8Decoder();//修复中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return SearchModel.fromJson(result);
    }else{
      throw Exception("FAIL");
    }
  }

  Future<HomeModel> getModel() async{
    final response = await http.get(HOME_URL);
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = new Utf8Decoder();//修复中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    }else{
      throw Exception("FAIL");
    }
  }
}