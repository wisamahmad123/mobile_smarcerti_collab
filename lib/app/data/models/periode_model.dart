class Periode {
  int idPeriode;
  DateTime tanggalMulai;
  DateTime tanggalBerakhir;
  String tahunPeriode;
  DateTime createdAt;
  DateTime updatedAt;

  Periode({
    required this.idPeriode,
    required this.tanggalMulai,
    required this.tanggalBerakhir,
    required this.tahunPeriode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Periode.fromJson(Map<String, dynamic> json) => Periode(
        idPeriode: json["id_periode"] ?? 0,
        tanggalMulai: DateTime.tryParse(json["tanggal_mulai"] ?? "") ?? DateTime(1970, 1, 1),
        tanggalBerakhir: DateTime.tryParse(json["tanggal_berakhir"] ?? "") ?? DateTime(1970, 1, 1),
        tahunPeriode: json["tahun_periode"] ?? "0000",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      );

  Map<String, dynamic> toJson() => {
        "id_periode": idPeriode,
        "tanggal_mulai": tanggalMulai.toIso8601String(),
        "tanggal_berakhir": tanggalBerakhir.toIso8601String(),
        "tahun_periode": tahunPeriode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static Periode defaultValue() => Periode(
        idPeriode: 0,
        tanggalMulai: DateTime(1970, 1, 1),
        tanggalBerakhir: DateTime(1970, 1, 1),
        tahunPeriode: "0000",
        createdAt: DateTime(1970, 1, 1),
        updatedAt: DateTime(1970, 1, 1),
      );
}
