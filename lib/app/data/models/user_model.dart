class User2Model {
  String? status;
  List<Users>? users;

  User2Model({this.status, this.users});

  User2Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
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

  Users(
      {this.id,
      this.idLevel,
      this.username,
      this.namaLengkap,
      this.noTelp,
      this.email,
      this.jenisKelamin,
      this.avatar,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
