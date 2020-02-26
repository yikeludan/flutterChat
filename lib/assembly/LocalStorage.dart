import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static var LocalStorageMap = new Map();

  static add(String key, var value){
    LocalStorageMap[key]=value;
  }
  static update(String key, var value){
    LocalStorageMap[key]=value;
  }

  static delete(String key){
    LocalStorageMap.remove(key);
  }

  static String  query(String key){
    if(LocalStorageMap.containsKey(key)){
      return LocalStorageMap[key];
    }else{
      return null;
    }
  }

}