class Pelatihan {
  final int idPelatihan;
  final String namaPelatihan;
  final String lokasi;
  final String levelPelatihan;
  final DateTime tanggal;
  final int idVendorPelatihan;
  final int idJenisPelatihan;
  final int idPeriode;
  final String buktiPelatihan;
  final int kuotaPeserta;
  final double biaya;

  Pelatihan({
    required this.idPelatihan,
    required this.namaPelatihan,
    required this.lokasi,
    required this.levelPelatihan,
    required this.tanggal,
    required this.idVendorPelatihan,
    required this.idJenisPelatihan,
    required this.idPeriode,
    required this.buktiPelatihan,
    required this.kuotaPeserta,
    required this.biaya,
  });

  // Factory constructor to create a Pelatihan instance from a JSON map
  factory Pelatihan.fromJson(Map<String, dynamic> json) {
    return Pelatihan(
      idPelatihan: json['id_pelatihan'],
      namaPelatihan: json['nama_pelatihan'],
      lokasi: json['lokasi'],
      levelPelatihan: json['level_pelatihan'],
      tanggal: DateTime.parse(json['tanggal']),
      idVendorPelatihan: json['id_vendor_pelatihan'],
      idJenisPelatihan: json['id_jenis_pelatihan'],
      idPeriode: json['id_periode'],
      buktiPelatihan: json['bukti_pelatihan'],
      kuotaPeserta: json['kuota_peserta'],
      biaya: json['biaya'].toDouble(),
    );
  }
}
