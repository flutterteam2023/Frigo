class PlaceModel{
  String? name;
  String? description;
  double? latitude;
  double? longitude;
  String? image;
  List<String>? images;
  String? phone;
  String? businessType;
  String? email;
  bool? seePhone;
  String? address;

  

  PlaceModel({this.name, this.description, this.latitude, this.longitude, this.image, this.images , this.phone, this.businessType, this.email, this.seePhone, this.address});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    images = json['images'].cast<String>();
    phone = json['phone'];
    businessType = json['businessType'];
    email = json['email'];
    seePhone = json['seePhone'];
    address = json['address'];

  }
}