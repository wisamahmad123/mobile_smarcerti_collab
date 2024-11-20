class MataKuliahPelatihan {
    int idMatakuliah;
    String namaMatakuliah;
    String kodeMatakuliah;
    DateTime createdAt;
    DateTime updatedAt;
    MataKuliahPelatihanPivot pivot;

    MataKuliahPelatihan({
        required this.idMatakuliah,
        required this.namaMatakuliah,
        required this.kodeMatakuliah,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory MataKuliahPelatihan.fromJson(Map<String, dynamic> json) => MataKuliahPelatihan(
        idMatakuliah: json["id_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: MataKuliahPelatihanPivot.fromJson(json["pivot"]),
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

class MataKuliahPelatihanPivot {
    int idPelatihan;
    int idMatakuliah;

    MataKuliahPelatihanPivot({
        required this.idPelatihan,
        required this.idMatakuliah,
    });

    factory MataKuliahPelatihanPivot.fromJson(Map<String, dynamic> json) => MataKuliahPelatihanPivot(
        idPelatihan: json["id_pelatihan"],
        idMatakuliah: json["id_matakuliah"],
    );

    Map<String, dynamic> toJson() => {
        "id_pelatihan": idPelatihan,
        "id_matakuliah": idMatakuliah,
    };
}