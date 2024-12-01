class MataKuliahSertifikasi {
  int idMatakuliah;
  String namaMatakuliah;
  String kodeMatakuliah;
  DateTime createdAt;
  DateTime updatedAt;

  MataKuliahSertifikasi({
    required this.idMatakuliah,
    required this.namaMatakuliah,
    required this.kodeMatakuliah,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MataKuliahSertifikasi.fromJson(Map<String, dynamic> json) =>
      MataKuliahSertifikasi(
        idMatakuliah: json["id_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_matakuliah": idMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class MataKuliahSertifikasiPivot {
  int idSertifikasi;
  int idMatakuliah;

  MataKuliahSertifikasiPivot({
    required this.idSertifikasi,
    required this.idMatakuliah,
  });

  factory MataKuliahSertifikasiPivot.fromJson(Map<String, dynamic> json) =>
      MataKuliahSertifikasiPivot(
        idSertifikasi: json["id_sertifikasi"],
        idMatakuliah: json["id_matakuliah"],
      );

  Map<String, dynamic> toJson() => {
        "id_sertifikasi": idSertifikasi,
        "id_matakuliah": idMatakuliah,
      };
}
