class BidangMinatPelatihan {
    int idBidangMinat;
    String namaBidangMinat;
    String kodeBidangMinat;
    DateTime createdAt;
    DateTime updatedAt;
    // BidangMinatPelatihanPivot pivot;

    BidangMinatPelatihan({
        required this.idBidangMinat,
        required this.namaBidangMinat,
        required this.kodeBidangMinat,
        required this.createdAt,
        required this.updatedAt,
        // required this.pivot,
    });

    factory BidangMinatPelatihan.fromJson(Map<String, dynamic> json) => BidangMinatPelatihan(
        idBidangMinat: json["id_bidang_minat"],
        namaBidangMinat: json["nama_bidang_minat"],
        kodeBidangMinat: json["kode_bidang_minat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // pivot: BidangMinatPelatihanPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id_bidang_minat": idBidangMinat,
        "nama_bidang_minat": namaBidangMinat,
        "kode_bidang_minat": kodeBidangMinat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        // "pivot": pivot.toJson(),
    };
}


class BidangMinatPelatihanPivot {
    int idPelatihan;
    int idBidangMinat;

    BidangMinatPelatihanPivot({
        required this.idPelatihan,
        required this.idBidangMinat,
    });

    factory BidangMinatPelatihanPivot.fromJson(Map<String, dynamic> json) => BidangMinatPelatihanPivot(
        idPelatihan: json["id_pelatihan"],
        idBidangMinat: json["id_bidang_minat"],
    );

    Map<String, dynamic> toJson() => {
        "id_pelatihan": idPelatihan,
        "id_bidang_minat": idBidangMinat,
    };
}