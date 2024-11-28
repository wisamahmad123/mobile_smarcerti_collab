import 'dart:convert';

import 'package:mobile_smarcerti/app/data/models/bidang_minat_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/detail_peserta_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_sertfikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_sertifikasi_model.dart';

class Sertifikasi {
  int idSertifikasi;
  String idVendorSertifikasi;
  String idJenisSertifikasi;
  String idPeriode;
  String namaSertifikasi;
  String jenis;
  DateTime tanggal;
  DateTime masaBerlaku;
  String kuotaPeserta;
  String biaya;
  String status;
  VendorSertifikasi vendorSertifikasi;
  JenisSertifikasi jenisSertifikasi;
  Periode periode;
  List<BidangMinatSertifikasi> bidangMinatSertifikasi;
  List<MataKuliahSertifikasi> mataKuliahSertifikasi;
  List<DetailPesertaSertifikasi> detailPesertaSertifikasi;

  Sertifikasi({
    required this.idSertifikasi,
    required this.idVendorSertifikasi,
    required this.idJenisSertifikasi,
    required this.idPeriode,
    required this.namaSertifikasi,
    required this.jenis,
    required this.tanggal,
    required this.masaBerlaku,
    required this.kuotaPeserta,
    required this.biaya,
    required this.status,
    required this.vendorSertifikasi,
    required this.jenisSertifikasi,
    required this.periode,
    required this.bidangMinatSertifikasi,
    required this.mataKuliahSertifikasi,
    required this.detailPesertaSertifikasi,
  });

  factory Sertifikasi.fromJson(Map<String, dynamic> json) => Sertifikasi(
        idSertifikasi: json["id_sertifikasi"],
        idVendorSertifikasi: json["id_vendor_sertifikasi"].toString(),
        idJenisSertifikasi: json["id_jenis_sertifikasi"].toString(),
        idPeriode: json["id_periode"].toString(),
        namaSertifikasi: json["nama_sertifikasi"].toString(),
        jenis: json["jenis"].toString(),
        tanggal: json["tanggal"] == null
            ? DateTime.now()
            : DateTime.parse(json["tanggal"]),
        masaBerlaku: json["masa_berlaku"] == null
            ? DateTime.now()
            : DateTime.parse(json["masa_berlaku"]),
        kuotaPeserta: json["kuota_peserta"].toString(),
        biaya: json["biaya"].toString(),
        status: json["status"].toString(),
        vendorSertifikasi:
            VendorSertifikasi.fromJson(json["vendor_sertifikasi"] ?? {}),
        jenisSertifikasi:
            JenisSertifikasi.fromJson(json["jenis_sertifikasi"] ?? {}),
        periode: Periode.fromJson(json["periode"] ?? {}),
        bidangMinatSertifikasi: json["bidang_minat_sertifikasi"] == null
            ? []
            : List<BidangMinatSertifikasi>.from(json["bidang_minat_sertifikasi"]
                .map((x) => BidangMinatSertifikasi.fromJson(x))),
        mataKuliahSertifikasi: json["mata_kuliah_sertifikasi"] == null
            ? []
            : List<MataKuliahSertifikasi>.from(json["mata_kuliah_sertifikasi"]
                .map((x) => MataKuliahSertifikasi.fromJson(x))),
        detailPesertaSertifikasi: json["detail_peserta_sertifikasi"] == null
            ? []
            : List<DetailPesertaSertifikasi>.from(
                json["detail_peserta_sertifikasi"]
                    .map((x) => DetailPesertaSertifikasi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_sertifikasi": idSertifikasi.toString(),
        "id_vendor_sertifikasi": idVendorSertifikasi.toString(),
        "id_jenis_sertifikasi": idJenisSertifikasi.toString(),
        "id_periode": idPeriode.toString(),
        "nama_sertifikasi": namaSertifikasi,
        "jenis": jenisSertifikasi,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "masa_berlaku":
            "${masaBerlaku.year.toString().padLeft(4, '0')}-${masaBerlaku.month.toString().padLeft(2, '0')}-${masaBerlaku.day.toString().padLeft(2, '0')}",
        "kuota_peserta": kuotaPeserta.toString(),
        "biaya": biaya.toString(),
        "status": biaya.toString(),
        "vendor_sertifikasi": vendorSertifikasi.toJson(),
        "jenis_sertifikasi": jenisSertifikasi.toJson(),
        "periode": periode.toJson(),
        "bidang_minat_sertifikasi":
            List<dynamic>.from(bidangMinatSertifikasi.map((x) => x.toJson())),
        "mata_kuliah_sertifikasi":
            List<dynamic>.from(mataKuliahSertifikasi.map((x) => x.toJson())),
        "detail_peserta_sertifikasi":
            List<dynamic>.from(detailPesertaSertifikasi.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Sertifikasi(idSertifikasi: $idSertifikasi, namaSertifikasi: $namaSertifikasi)';
  }
}
