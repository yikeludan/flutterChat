class SearchCommModel {
  String auth;
  String errcode;
  String code;
  String word;
  String type;
  String districtname;
  String url;
  String star;
  String price;
  String zonename;

  SearchCommModel(
      {this.auth,
      this.errcode,
      this.code,
      this.word,
      this.type,
      this.districtname,
      this.url,
      this.price,
      this.star,
      this.zonename});

  factory SearchCommModel.fromJson(Map<String, dynamic> json) {
    return json != null
        ? SearchCommModel(
            auth: json['auth'],
            errcode: json['errcode'],
            code: json['code'],
            word: json['word'],
            type: json['type'],
            districtname: json['districtname'],
            url: json['url'],
            price: json['price'],
            star: json['star'],
            zonename: json['zonename'],
          )
        : null;
  }
}
