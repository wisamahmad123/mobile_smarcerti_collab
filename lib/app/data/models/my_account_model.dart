import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';

class MyAccount {
  String userId;
  String idLevel;
  String username;
  String namaLengkap;
  String noTelp;
  String email;
  String jenisKelamin;
  String avatar;
  DateTime createdAt;
  DateTime updatedAt;
  List<MataKuliahMyAccountModel> detailDaftarUserMatakuliah;
  List<BidangMinatMyAccountModel> detailDaftarUserBidangMinat;

  MyAccount({
    required this.userId,
    required this.idLevel,
    required this.username,
    required this.namaLengkap,
    required this.noTelp,
    required this.email,
    required this.jenisKelamin,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.detailDaftarUserMatakuliah,
    required this.detailDaftarUserBidangMinat,
  });

  factory MyAccount.fromJson(Map<String, dynamic> json) => MyAccount(
        userId: json["user_id"].toString(),
        idLevel: json["id_level"].toString(),
        username: json["username"],
        namaLengkap: json["nama_lengkap"],
        noTelp: json["no_telp"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        detailDaftarUserMatakuliah: List<MataKuliahMyAccountModel>.from(
            json["detail_daftar_user_matakuliah"]
                .map((x) => MataKuliahMyAccountModel.fromJson(x))),
        detailDaftarUserBidangMinat: List<BidangMinatMyAccountModel>.from(
            json["detail_daftar_user_bidang_minat"]
                .map((x) => BidangMinatMyAccountModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId.toString(),
        "id_level": idLevel.toString(),
        "username": username,
        "nama_lengkap": namaLengkap,
        "no_telp": noTelp,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "detail_daftar_user_matakuliah": List<dynamic>.from(
            detailDaftarUserMatakuliah.map((x) => x.toJson())),
        "detail_daftar_user_bidang_minat": List<dynamic>.from(
            detailDaftarUserBidangMinat.map((x) => x.toJson())),
      };

  // Getter untuk URL avatar
  String get avatarUrl {
    const baseUrl = 'http://192.168.1.6:8000/storage/photos/';
    return avatar.isNotEmpty ? '$baseUrl$avatar' : '';
  }
}
