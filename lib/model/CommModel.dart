class CommModel{
  String icon;
  String url;
  String title;
  String statusBarColor;
  bool hideAppBar;

  CommModel({this.icon,this.url,this.title,this.statusBarColor,this.hideAppBar});

  factory CommModel.fromJson(Map<String,dynamic> json){
    return json != null? CommModel(
        icon:json['icon'],
        url:json['url'],
        title:json['title'],
        statusBarColor:json['statusBarColor'],
        hideAppBar:json['hideAppBar'],
    ):null;
  }
}