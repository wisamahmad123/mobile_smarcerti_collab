import 'dart:convert';

import 'package:mobile_smarcerti/app/data/models/bidang_minat_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/detail_peserta_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_pelatihan_model.dart';

// Pelatihan pelatihanFromJson(String str) => Pelatihan.fromJson(json.decode(str));

// String pelatihanToJson(Pelatihan data) => json.encode(data.toJson());

// class Pelatihan {
//   final bool success;
//   final String message;
//   final List<Datum> data;

//   Pelatihan({
//     required this.success,
//     required this.message,
//     required this.data,
//   });

//   factory Pelatihan.fromJson(Map<String, dynamic> json) => Pelatihan(
//         success: json["success"] ?? false,
//         message: json["message"] ?? "",
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };

//   // Override toString() to return a meaningful string representation
//   @override
//   String toString() {
//     return 'Pelatihan(success: $success, message: $message, dataCount: ${data.length})';
//   }
// }

class Pelatihan {
  String idPelatihan;
  String idVendorPelatihan;
  String idJenisPelatihan;
  String idPeriode;
  String namaPelatihan;
  String lokasi;
  String levelPelatihan;
  DateTime tanggal;
  String kuotaPeserta;
  String biaya;
  String status;
  VendorPelatihan vendorPelatihan;
  JenisPelatihan jenisPelatihan;
  Periode periode;
  List<BidangMinatPelatihan> bidangMinatPelatihan;
  List<MataKuliahPelatihan> mataKuliahPelatihan;
  List<DetailPesertaPelatihan> detailPesertaPelatihan;

  Pelatihan({
    required this.idPelatihan,
    required this.idVendorPelatihan,
    required this.idJenisPelatihan,
    required this.idPeriode,
    required this.namaPelatihan,
    required this.lokasi,
    required this.levelPelatihan,
    required this.tanggal,
    required this.kuotaPeserta,
    required this.biaya,
    required this.status,
    required this.vendorPelatihan,
    required this.jenisPelatihan,
    required this.periode,
    required this.bidangMinatPelatihan,
    required this.mataKuliahPelatihan,
    required this.detailPesertaPelatihan,
  });

  factory Pelatihan.fromJson(Map<String, dynamic> json) => Pelatihan(
        idPelatihan: json["id_pelatihan"].toString(),
        idVendorPelatihan: json["id_vendor_pelatihan"].toString(),
        idJenisPelatihan: json["id_jenis_pelatihan"].toString(),
        idPeriode: json["id_periode"].toString(),
        namaPelatihan: json["nama_pelatihan"].toString(),
        lokasi: json["lokasi"].toString(),
        levelPelatihan: json["level_pelatihan"].toString(),
        tanggal: json["tanggal"] == null
            ? DateTime.now()
            : DateTime.parse(json["tanggal"]),
        kuotaPeserta: json["kuota_peserta"].toString(),
        biaya: json["biaya"].toString(),
        status: json["status_pelatihan"].toString(),
        vendorPelatihan:
            VendorPelatihan.fromJson(json["vendor_pelatihan"] ?? {}),
        jenisPelatihan: JenisPelatihan.fromJson(json["jenis_pelatihan"] ?? {}),
        periode: Periode.fromJson(json["periode"] ?? {}),
        bidangMinatPelatihan: json["bidang_minat_pelatihan"] == null
            ? []
            : List<BidangMinatPelatihan>.from(json["bidang_minat_pelatihan"]
                .map((x) => BidangMinatPelatihan.fromJson(x))),
        mataKuliahPelatihan: json["mata_kuliah_pelatihan"] == null
            ? []
            : List<MataKuliahPelatihan>.from(json["mata_kuliah_pelatihan"]
                .map((x) => MataKuliahPelatihan.fromJson(x))),
        detailPesertaPelatihan: json["detail_peserta_pelatihan"] == null
            ? []
            : List<DetailPesertaPelatihan>.from(json["detail_peserta_pelatihan"]
                .map((x) => DetailPesertaPelatihan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_pelatihan": idPelatihan.toString(),
        "id_vendor_pelatihan": idVendorPelatihan.toString(),
        "id_jenis_pelatihan": idJenisPelatihan.toString(),
        "id_periode": idPeriode.toString(),
        "nama_pelatihan": namaPelatihan,
        "lokasi": lokasi,
        "level_pelatihan": levelPelatihan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "kuota_peserta": kuotaPeserta.toString(),
        "biaya": biaya.toString(),
        "vendor_pelatihan": vendorPelatihan.toJson(),
        "jenis_pelatihan": jenisPelatihan.toJson(),
        "periode": periode.toJson(),
        "bidang_minat_pelatihan":
            List<dynamic>.from(bidangMinatPelatihan.map((x) => x.toJson())),
        "mata_kuliah_pelatihan":
            List<dynamic>.from(mataKuliahPelatihan.map((x) => x.toJson())),
        "detail_peserta_pelatihan":
            List<dynamic>.from(detailPesertaPelatihan.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Datum(idPelatihan: $idPelatihan, namaPelatihan: $namaPelatihan)';
  }
}
