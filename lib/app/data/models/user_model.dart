import 'package:mobile_smarcerti/app/data/models/auth_model.dart';

class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? idLevel;
  String? username;
  String? namaLengkap;
  String? noTelp;
  String? email;
  String? jenisKelamin;
  String? avatar;
  String? createdAt;
  String? updatedAt;

  User({
    required this.id,
    required this.idLevel,
    required this.username,
    required this.namaLengkap,
    required this.noTelp,
    required this.email,
    required this.jenisKelamin,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    idLevel = json['id_level'].toString();
    username = json['username'];
    namaLengkap = json['nama_lengkap'];
    noTelp = json['no_telp'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['id_level'] = this.idLevel.toString();
    data['username'] = this.username;
    data['nama_lengkap'] = this.namaLengkap;
    data['no_telp'] = this.noTelp;
    data['email'] = this.email;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['avatar'] = this.avatar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  String get avatarUrl {
    const baseUrl = 'http://192.168.1.6:8000/storage/photos/';
    return '$baseUrl$avatar';
  }
}
