class DetailPesertaPelatihan {
    int userId;
    int idLevel;
    String username;
    String namaLengkap;
    String noTelp;
    String email;
    String jenisKelamin;
    String avatar;
    DateTime createdAt;
    DateTime updatedAt;
    DetailPesertaPelatihanPivot pivot;

    DetailPesertaPelatihan({
        required this.userId,
        required this.idLevel,
        required this.username,
        required this.namaLengkap,
        required this.noTelp,
        required this.email,
        required this.jenisKelamin,
        required this.avatar,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory DetailPesertaPelatihan.fromJson(Map<String, dynamic> json) => DetailPesertaPelatihan(
        userId: json["user_id"],
        idLevel: json["id_level"],
        username: json["username"],
        namaLengkap: json["nama_lengkap"],
        noTelp: json["no_telp"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: DetailPesertaPelatihanPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id_level": idLevel,
        "username": username,
        "nama_lengkap": namaLengkap,
        "no_telp": noTelp,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class DetailPesertaPelatihanPivot {
    int idPelatihan;
    int userId;

    DetailPesertaPelatihanPivot({
        required this.idPelatihan,
        required this.userId,
    });

    factory DetailPesertaPelatihanPivot.fromJson(Map<String, dynamic> json) => DetailPesertaPelatihanPivot(
        idPelatihan: json["id_pelatihan"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id_pelatihan": idPelatihan,
        "user_id": userId,
    };
}