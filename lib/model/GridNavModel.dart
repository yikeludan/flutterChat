import 'package:travel/model/HotelModel.dart';

class GridNavModel{
  HotelModel hotel;
  HotelModel flight;
  HotelModel travel;
  GridNavModel({this.hotel,this.flight,this.travel});
  factory GridNavModel.fromJson(Map<String,dynamic> json){
    return json != null?GridNavModel(
      hotel:HotelModel.fromJson(json['hotel']),
      flight:HotelModel.fromJson(json['flight']),
      travel:HotelModel.fromJson(json['travel'])
    ):null;
  }
}