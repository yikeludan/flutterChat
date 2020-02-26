import 'package:travel/model/CommModel.dart';

class HotelModel{
  String startColor;
  String endColor;
  CommModel mainItem;
  CommModel item1;
  CommModel item2;
  CommModel item3;
  CommModel item4;

  HotelModel({this.startColor,this.endColor,
      this.mainItem,this.item1,this.item2,
      this.item3,this.item4});


  factory HotelModel.fromJson(Map<String,dynamic> json){
    return json != null?HotelModel(
        startColor:json['startColor'],
        endColor:json['endColor'],
        mainItem:CommModel.fromJson(json['mainItem']),
        item1:CommModel.fromJson(json['item1']),
        item2:CommModel.fromJson(json['item2']),
        item3:CommModel.fromJson(json['item3']),
        item4:CommModel.fromJson(json['item4'])
    ):null;
  }
}