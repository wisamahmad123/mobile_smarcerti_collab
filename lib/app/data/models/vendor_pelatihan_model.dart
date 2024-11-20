class VendorPelatihan {
  int idVendorPelatihan;
  String nama;
  String alamat;
  String kota;
  String noTelp;
  String alamatWeb;
  DateTime createdAt;
  DateTime updatedAt;

  VendorPelatihan({
    required this.idVendorPelatihan,
    required this.nama,
    required this.alamat,
    required this.kota,
    required this.noTelp,
    required this.alamatWeb,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorPelatihan.fromJson(Map<String, dynamic> json) => VendorPelatihan(
        idVendorPelatihan: json["id_vendor_pelatihan"] ?? 0,
        nama: json["nama"] ?? "Vendor Tidak Diketahui",
        alamat: json["alamat"] ?? "Alamat Tidak Diketahui",
        kota: json["kota"] ?? "Kota Tidak Diketahui",
        noTelp: json["no_telp"] ?? "-",
        alamatWeb: json["alamat_web"] ?? "-",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      );

  Map<String, dynamic> toJson() => {
        "id_vendor_pelatihan": idVendorPelatihan,
        "nama": nama,
        "alamat": alamat,
        "kota": kota,
        "no_telp": noTelp,
        "alamat_web": alamatWeb,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static VendorPelatihan defaultValue() => VendorPelatihan(
        idVendorPelatihan: 0,
        nama: "Vendor Tidak Tersedia",
        alamat: "Tidak Ada Alamat",
        kota: "Tidak Ada Kota",
        noTelp: "-",
        alamatWeb: "-",
        createdAt: DateTime(1970, 1, 1),
        updatedAt: DateTime(1970, 1, 1),
      );
}
