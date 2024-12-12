class DetailPesertaSertifikasi {
    int userId;
    int idLevel;
    String username;
    String namaLengkap;
    String? nip;
    dynamic noTelp;
    dynamic email;
    dynamic jenisKelamin;
    dynamic avatar;
    DateTime? createdAt;
    DateTime? updatedAt;
    DetailPesertaSertifikasiPivot? pivot;

    DetailPesertaSertifikasi({
        required this.userId,
        required this.idLevel,
        required this.username,
        required this.namaLengkap,
        this.nip,
        this.noTelp,
        this.email,
        this.jenisKelamin,
        this.avatar,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory DetailPesertaSertifikasi.fromJson(Map<String, dynamic> json) => DetailPesertaSertifikasi(
        userId: json["user_id"] ?? 0,
        idLevel: json["id_level"] ?? 0,
        username: json["username"] ?? '',
        namaLengkap: json["nama_lengkap"] ?? '',
        nip: json["nip"] ?? '',
        noTelp: json["no_telp"] ?? '',
        email: json["email"] ?? '',
        jenisKelamin: json["jenis_kelamin"],
        avatar: json["avatar"],
        createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
        pivot: json["pivot"] != null ? DetailPesertaSertifikasiPivot.fromJson(json["pivot"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id_level": idLevel,
        "username": username,
        "nama_lengkap": namaLengkap,
        "nip": nip,
        "no_telp": noTelp,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "avatar": avatar,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class DetailPesertaSertifikasiPivot {
    int idSertifikasi;
    int userId;
    int idDetailPesertaSertifikasi;
    dynamic noSertifikasi;
    dynamic buktiSertifikasi;

    DetailPesertaSertifikasiPivot({
        required this.idSertifikasi,
        required this.userId,
        required this.idDetailPesertaSertifikasi,
        this.noSertifikasi,
        this.buktiSertifikasi,
    });

    factory DetailPesertaSertifikasiPivot.fromJson(Map<String, dynamic> json) => DetailPesertaSertifikasiPivot(
        idSertifikasi: json["id_sertifikasi"] ?? 0,
        userId: json["user_id"] ?? 0,
        idDetailPesertaSertifikasi: json["id_detail_peserta_sertifikasi"] ?? 0,
        noSertifikasi: json["no_sertifikasi"],
        buktiSertifikasi: json["bukti_sertifikasi"],
    );

    Map<String, dynamic> toJson() => {
        "id_sertifikasi": idSertifikasi,
        "user_id": userId,
        "id_detail_peserta_sertifikasi": idDetailPesertaSertifikasi,
        "no_sertifikasi": noSertifikasi,
        "bukti_sertifikasi": buktiSertifikasi,
    };
}
