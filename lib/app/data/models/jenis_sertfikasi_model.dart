class JenisSertifikasi {
  int idJenisSertifikasi;
  String namaJenisSertifikasi;
  String kodeJenisSertifikasi;
  DateTime createdAt;
  DateTime updatedAt;

  JenisSertifikasi({
    required this.idJenisSertifikasi,
    required this.namaJenisSertifikasi,
    required this.kodeJenisSertifikasi,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory untuk mem-parsing dari JSON
  factory JenisSertifikasi.fromJson(Map<String, dynamic> json) => JenisSertifikasi(
        idJenisSertifikasi: json["id_jenis_sertifikasi"] ?? 0,
        namaJenisSertifikasi: json["nama_jenis_sertifikasi"] ?? "Jenis Sertifikasi Tidak Diketahui",
        kodeJenisSertifikasi: json["kode_jenis_sertifikasi"] ?? "-",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      );

  // Konversi objek ke JSON
  Map<String, dynamic> toJson() => {
        "id_jenis_sertifikasi": idJenisSertifikasi,
        "nama_jenis_sertifikasi": namaJenisSertifikasi,
        "kode_jenis_sertifikasi": kodeJenisSertifikasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  // Memberikan nilai default untuk objek JenisSertifikasi
  static JenisSertifikasi defaultValue() => JenisSertifikasi(
        idJenisSertifikasi: 0,
        namaJenisSertifikasi: "Jenis Sertifikasi Tidak Tersedia",
        kodeJenisSertifikasi: "-",
        createdAt: DateTime(1970, 1, 1),
        updatedAt: DateTime(1970, 1, 1),
      );
}
