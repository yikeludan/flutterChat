import 'package:travel/model/CommModel.dart';

class SalesBoxModel {
  String icon;
  String moreUrl;
  CommModel bigCard1;
  CommModel bigCard2;
  CommModel smallCard1;
  CommModel smallCard2;
  CommModel smallCard3;
  CommModel smallCard4;

  SalesBoxModel({this.icon,this.moreUrl,this.bigCard1,
  this.bigCard2,this.smallCard1,this.smallCard2,this.smallCard3,this.smallCard4});

  factory SalesBoxModel.fromJson(Map<String,dynamic> json){
    return json != null?SalesBoxModel(
        icon:json['icon'],
        moreUrl:json['moreUrl'],
        bigCard1:CommModel.fromJson(json['bigCard1']),
        bigCard2:CommModel.fromJson(json['bigCard2']),
        smallCard1:CommModel.fromJson(json['smallCard1']),
        smallCard2:CommModel.fromJson(json['smallCard2']),
        smallCard3:CommModel.fromJson(json['smallCard3']),
        smallCard4:CommModel.fromJson(json['smallCard4'])
    ):null;
  }

}