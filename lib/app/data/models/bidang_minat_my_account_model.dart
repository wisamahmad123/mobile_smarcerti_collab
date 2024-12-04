class BidangMinatMyAccountModel {
  int idBidangMinat;
  String namaBidangMinat;
  String kodeBidangMinat;
  DateTime createdAt;
  DateTime updatedAt;

  BidangMinatMyAccountModel({
    required this.idBidangMinat,
    required this.namaBidangMinat,
    required this.kodeBidangMinat,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BidangMinatMyAccountModel.fromJson(Map<String, dynamic> json) =>
      BidangMinatMyAccountModel(
        idBidangMinat: json["id_bidang_minat"],
        namaBidangMinat: json["nama_bidang_minat"],
        kodeBidangMinat: json["kode_bidang_minat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_bidang_minat": idBidangMinat.toString(),
        "nama_bidang_minat": namaBidangMinat,
        "kode_bidang_minat": kodeBidangMinat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
