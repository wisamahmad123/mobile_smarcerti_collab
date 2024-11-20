class LoginResponse {
  String? status;
  User? user;
  String? token;

  LoginResponse({this.status, this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  int? idLevel;
  String? username;
  String? namaLengkap;
  String? noTelp;
  String? email;
  String? jenisKelamin;
  String? avatar;
  String? createdAt;
  String? updatedAt;

  User(
      {required this.id,
        required this.idLevel,
        required this.username,
        required this.namaLengkap,
        required this.noTelp,
        required this.email,
        required this.jenisKelamin,
        required this.avatar,
        required this.createdAt,
        required this.updatedAt,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLevel = json['id_level'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['id_level'] = this.idLevel;
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
}
