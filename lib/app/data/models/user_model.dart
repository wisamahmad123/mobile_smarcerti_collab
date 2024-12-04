import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';

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
  List<MataKuliahMyAccountModel>? detailDaftarUserMatakuliah;
  List<BidangMinatMyAccountModel>? detailDaftarUserBidangMinat;

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
    this.detailDaftarUserMatakuliah,
    this.detailDaftarUserBidangMinat,
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
    detailDaftarUserMatakuliah = json['detail_daftar_user_matakuliah'] != null
        ? List<MataKuliahMyAccountModel>.from(
            json['detail_daftar_user_matakuliah']
                .map((x) => MataKuliahMyAccountModel.fromJson(x)))
        : [];
    detailDaftarUserBidangMinat =
        json['detail_daftar_user_bidang_minat'] != null
            ? List<BidangMinatMyAccountModel>.from(
                json['detail_daftar_user_bidang_minat']
                    .map((x) => BidangMinatMyAccountModel.fromJson(x)))
            : [];
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
    data['detail_daftar_user_matakuliah'] = detailDaftarUserMatakuliah != null
        ? detailDaftarUserMatakuliah!.map((x) => x.toJson()).toList()
        : [];
    data['detail_daftar_user_bidang_minat'] =
        detailDaftarUserBidangMinat != null
            ? detailDaftarUserBidangMinat!.map((x) => x.toJson()).toList()
            : [];
    return data;
  }

  String get avatarUrl {
    var baseUrl = '${ApiConstants.hostname}storage/photos/';
    return '$baseUrl$avatar';
  }
}
