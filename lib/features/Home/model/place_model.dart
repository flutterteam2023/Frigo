class PlaceModel{
  String? name;
  String? description;
  double? latitude;
  double? longitude;
  String? image;
  List<String>? images;

  PlaceModel({this.name, this.description, this.latitude, this.longitude, this.image, this.images});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    images = json['images'].cast<String>();
  }
}