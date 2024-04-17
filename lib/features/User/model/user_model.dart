class UserModel{

  String? name;
  String? surname;
  String? email;
  String? role;
  String? uid;
  String? userType;


  UserModel({this.name, this.email, this.role, this.uid, this.userType, this.surname});

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    role = json['role'];
    uid = json['uid'];
    userType = json['userType'];
    surname = json['surname'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['uid'] = uid;
    data['userType'] = userType;
    data['surname'] = surname;

    return data;
  }
}