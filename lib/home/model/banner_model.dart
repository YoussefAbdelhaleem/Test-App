class BannerModel {
  int? statusCode;
  List<BannerData>? data;
  String? message;

  BannerModel({this.statusCode, this.data, this.message});

  BannerModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(BannerData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class BannerData {
  String? image;

  BannerData({this.image});

  BannerData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}
