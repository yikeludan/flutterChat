import 'package:travel/model/GridNavModel.dart';
import 'package:travel/model/SalesBoxModel.dart';
import 'CommModel.dart';
import 'ConfigModel.dart';

class HomeModel{
  ConfigModel config;
  List<CommModel> bannerList;
  List<CommModel> localNavList;
  GridNavModel gridNav;
  List<CommModel> subNavList;
  SalesBoxModel salesBox;

  HomeModel({this.config,this.bannerList,this.localNavList,this.gridNav,this.subNavList,
  this.salesBox});

  factory HomeModel.fromJson(Map<String,dynamic> json){
    var bannerListJson = json['bannerList'] as List;
    List<CommModel> bannerList =
        bannerListJson.map((i)=>CommModel.fromJson(i)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommModel> localNavList =
        localNavListJson.map((i)=>CommModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommModel> subNavList =
        subNavListJson.map((i)=>CommModel.fromJson(i)).toList();

    return json != null?HomeModel(
        config:ConfigModel.fromJson(json['config']),
        bannerList:bannerList,
        localNavList:localNavList,
        gridNav:GridNavModel.fromJson(json['gridNav']),
        subNavList:subNavList,
        salesBox:SalesBoxModel.fromJson(json['salesBox'])
    ):null;
  }
}