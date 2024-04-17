class BusinessModel{
  String? businessName;
  String? businessType;
  String? description;
  String? email;
  DateTime? endDate;
  List<String>? images;
  String? lat;
  String? long;
  String? phone;
  bool? seePhone;
  DateTime? startDate;
  int? subscription;
  String? uid;
  String? userType;

  BusinessModel({this.businessName, this.businessType, this.description, this.email, this.endDate, this.images, this.lat, this.long, this.phone, this.seePhone, this.startDate, this.subscription, this.uid, this.userType});

  BusinessModel.fromJson(Map<String, dynamic> json){
    businessName = json['businessName'];
    businessType = json['businessType'];
    description = json['description'];
    email = json['email'];
    endDate = json['endDate'];
    images = json['images'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    seePhone = json['seePhone'];
    startDate = json['startDate'];
    subscription = json['subscription'];
    uid = json['uid'];
    userType = json['userType'];

  }




}