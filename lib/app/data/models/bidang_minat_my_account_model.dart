class BidangMinatMyAccountModel {
    int idBidangMinat;
    String namaBidangMinat;
    String kodeBidangMinat;
    DateTime createdAt;
    DateTime updatedAt;
    BidangMinatMyAccountModelPivot pivot;

    BidangMinatMyAccountModel({
        required this.idBidangMinat,
        required this.namaBidangMinat,
        required this.kodeBidangMinat,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory BidangMinatMyAccountModel.fromJson(Map<String, dynamic> json) => BidangMinatMyAccountModel(
        idBidangMinat: json["id_bidang_minat"],
        namaBidangMinat: json["nama_bidang_minat"],
        kodeBidangMinat: json["kode_bidang_minat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: BidangMinatMyAccountModelPivot.fromJson(json["pivot"]),
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

class BidangMinatMyAccountModelPivot {
    int userId;
    int idBidangMinat;

    BidangMinatMyAccountModelPivot({
        required this.userId,
        required this.idBidangMinat,
    });

    factory BidangMinatMyAccountModelPivot.fromJson(Map<String, dynamic> json) => BidangMinatMyAccountModelPivot(
        userId: json["user_id"],
        idBidangMinat: json["id_bidang_minat"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id_bidang_minat": idBidangMinat,
    };
}