class JenisPelatihan {
  int idJenisPelatihan;
  String namaJenisPelatihan;
  String kodePelatihan;
  DateTime createdAt;
  DateTime updatedAt;

  JenisPelatihan({
    required this.idJenisPelatihan,
    required this.namaJenisPelatihan,
    required this.kodePelatihan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JenisPelatihan.fromJson(Map<String, dynamic> json) => JenisPelatihan(
        idJenisPelatihan: json["id_jenis_pelatihan"] ?? 0,
        namaJenisPelatihan: json["nama_jenis_pelatihan"] ?? "Jenis Tidak Diketahui",
        kodePelatihan: json["kode_pelatihan"] ?? "-",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      );

  Map<String, dynamic> toJson() => {
        "id_jenis_pelatihan": idJenisPelatihan,
        "nama_jenis_pelatihan": namaJenisPelatihan,
        "kode_pelatihan": kodePelatihan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static JenisPelatihan defaultValue() => JenisPelatihan(
        idJenisPelatihan: 0,
        namaJenisPelatihan: "Jenis Tidak Tersedia",
        kodePelatihan: "-",
        createdAt: DateTime(1970, 1, 1),
        updatedAt: DateTime(1970, 1, 1),
      );
}
