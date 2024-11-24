class VendorSertifikasi {
  int idVendorSertifikasi;
  String nama;
  String alamat;
  String kota;
  String noTelp;
  String alamatWeb;
  DateTime createdAt;
  DateTime updatedAt;

  VendorSertifikasi({
    required this.idVendorSertifikasi,
    required this.nama,
    required this.alamat,
    required this.kota,
    required this.noTelp,
    required this.alamatWeb,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorSertifikasi.fromJson(Map<String, dynamic> json) => VendorSertifikasi(
        idVendorSertifikasi: json["id_vendor_sertifikasi"] ?? 0,
        nama: json["nama"] ?? "Vendor Tidak Diketahui",
        alamat: json["alamat"] ?? "Alamat Tidak Diketahui",
        kota: json["kota"] ?? "Kota Tidak Diketahui",
        noTelp: json["no_telp"] ?? "-",
        alamatWeb: json["alamat_web"] ?? "-",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      );

  Map<String, dynamic> toJson() => {
        "id_vendor_sertifikasi": idVendorSertifikasi,
        "nama": nama,
        "alamat": alamat,
        "kota": kota,
        "no_telp": noTelp,
        "alamat_web": alamatWeb,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static VendorSertifikasi defaultValue() => VendorSertifikasi(
        idVendorSertifikasi: 0,
        nama: "Vendor Tidak Tersedia",
        alamat: "Tidak Ada Alamat",
        kota: "Tidak Ada Kota",
        noTelp: "-",
        alamatWeb: "-",
        createdAt: DateTime(1970, 1, 1),
        updatedAt: DateTime(1970, 1, 1),
      );
}
