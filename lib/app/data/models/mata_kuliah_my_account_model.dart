class MataKuliahMyAccountModel {
  int idMatakuliah;
  String namaMatakuliah;
  String kodeMatakuliah;
  DateTime createdAt;
  DateTime updatedAt;
  MataKuliahMyAccountModelPivot pivot;

  MataKuliahMyAccountModel({
    required this.idMatakuliah,
    required this.namaMatakuliah,
    required this.kodeMatakuliah,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory MataKuliahMyAccountModel.fromJson(Map<String, dynamic> json) =>
      MataKuliahMyAccountModel(
        idMatakuliah: json["id_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: MataKuliahMyAccountModelPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id_matakuliah": idMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class MataKuliahMyAccountModelPivot {
  int userId;
  int idMatakuliah;

  MataKuliahMyAccountModelPivot({
    required this.userId,
    required this.idMatakuliah,
  });

  factory MataKuliahMyAccountModelPivot.fromJson(Map<String, dynamic> json) =>
      MataKuliahMyAccountModelPivot(
        userId: json["user_id"],
        idMatakuliah: json["id_matakuliah"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id_matakuliah": idMatakuliah,
      };
}
