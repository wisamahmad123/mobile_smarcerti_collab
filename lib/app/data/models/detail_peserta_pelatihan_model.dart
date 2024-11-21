class DetailPesertaPelatihan {
    int userId;
    int idLevel;
    String username;
    String namaLengkap;
    dynamic noTelp;
    dynamic email;
    dynamic jenisKelamin;
    dynamic avatar;
    DateTime? createdAt;
    DateTime? updatedAt;
    DetailPesertaPelatihanPivot? pivot;

    DetailPesertaPelatihan({
        required this.userId,
        required this.idLevel,
        required this.username,
        required this.namaLengkap,
        this.noTelp,
        this.email,
        this.jenisKelamin,
        this.avatar,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory DetailPesertaPelatihan.fromJson(Map<String, dynamic> json) => DetailPesertaPelatihan(
        userId: json["user_id"] ?? 0,
        idLevel: json["id_level"] ?? 0,
        username: json["username"] ?? '',
        namaLengkap: json["nama_lengkap"] ?? '',
        noTelp: json["no_telp"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        avatar: json["avatar"],
        createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
        pivot: json["pivot"] != null ? DetailPesertaPelatihanPivot.fromJson(json["pivot"]) : null,
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class DetailPesertaPelatihanPivot {
    int idPelatihan;
    int userId;
    int idDetailPesertaPelatihan;
    dynamic noPelatihan;
    dynamic buktiPelatihan;

    DetailPesertaPelatihanPivot({
        required this.idPelatihan,
        required this.userId,
        required this.idDetailPesertaPelatihan,
        this.noPelatihan,
        this.buktiPelatihan,
    });

    factory DetailPesertaPelatihanPivot.fromJson(Map<String, dynamic> json) => DetailPesertaPelatihanPivot(
        idPelatihan: json["id_pelatihan"] ?? 0,
        userId: json["user_id"] ?? 0,
        idDetailPesertaPelatihan: json["id_detail_peserta_pelatihan"] ?? 0,
        noPelatihan: json["no_pelatihan"],
        buktiPelatihan: json["bukti_pelatihan"],
    );

    Map<String, dynamic> toJson() => {
        "id_pelatihan": idPelatihan,
        "user_id": userId,
        "id_detail_peserta_pelatihan": idDetailPesertaPelatihan,
        "no_pelatihan": noPelatihan,
        "bukti_pelatihan": buktiPelatihan,
    };
}
