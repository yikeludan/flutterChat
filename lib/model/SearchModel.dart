import 'SearchCommModel.dart';

class SearchModel {
  SearchCommModel head;
  List<SearchCommModel> data;

  SearchModel({
    this.head,
    this.data
  });

  factory SearchModel.fromJson(Map<String,dynamic> json){
    var dataJson = json['data'] as List;
    List<SearchCommModel> data =
    dataJson.map((i)=>SearchCommModel.fromJson(i)).toList();



    return json != null?SearchModel(
        head:SearchCommModel.fromJson(json['head']),
        data:data,
    ):null;
  }

}