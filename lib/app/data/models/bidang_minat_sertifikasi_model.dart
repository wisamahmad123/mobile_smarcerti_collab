class BidangMinatSertifikasi {
    int idBidangMinat;
    String namaBidangMinat;
    String kodeBidangMinat;
    DateTime createdAt;
    DateTime updatedAt;
    BidangMinatSertifikasiPivot pivot;

    BidangMinatSertifikasi({
        required this.idBidangMinat,
        required this.namaBidangMinat,
        required this.kodeBidangMinat,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory BidangMinatSertifikasi.fromJson(Map<String, dynamic> json) => BidangMinatSertifikasi(
        idBidangMinat: json["id_bidang_minat"],
        namaBidangMinat: json["nama_bidang_minat"],
        kodeBidangMinat: json["kode_bidang_minat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: BidangMinatSertifikasiPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id_bidang_minat": idBidangMinat,
        "nama_bidang_minat": namaBidangMinat,
        "kode_bidang_minat": kodeBidangMinat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class BidangMinatSertifikasiPivot {
    int idSertifikasi;
    int idBidangMinat;

    BidangMinatSertifikasiPivot({
        required this.idSertifikasi,
        required this.idBidangMinat,
    });

    factory BidangMinatSertifikasiPivot.fromJson(Map<String, dynamic> json) => BidangMinatSertifikasiPivot(
        idSertifikasi: json["id_sertifikasi"],
        idBidangMinat: json["id_bidang_minat"],
    );

    Map<String, dynamic> toJson() => {
        "id_sertifikasi": idSertifikasi,
        "id_bidang_minat": idBidangMinat,
    };
}