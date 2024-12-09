import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart'; // Tambahkan jika ada model Pelatihan
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';

class DetailNotifikasiPage extends StatelessWidget {
  final dynamic notifikasiDetail; // Bisa berupa Sertifikasi atau Pelatihan

  DetailNotifikasiPage({super.key, required this.notifikasiDetail});

  @override
  Widget build(BuildContext context) {
    // Cek apakah notifikasiDetail adalah Sertifikasi atau Pelatihan
    final bool isSertifikasi = notifikasiDetail is Sertifikasi;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(
        title: isSertifikasi
            ? "Detail Notifikasi Sertifikasi"
            : "Detail Notifikasi Pelatihan",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Sertifikasi atau Pelatihan
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                _getTitle(),
                maxLines: 3,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF375E97),
                ),
              ),
            ),
            // Detail berdasarkan tipe
            if (isSertifikasi)
              ..._buildSertifikasiDetail(notifikasiDetail as Sertifikasi)
            else
              ..._buildPelatihanDetail(notifikasiDetail as PelatihanUser),
          ],
        ),
      ),
    );
  }

  String _getTitle() {
    if (notifikasiDetail is Sertifikasi) {
      return (notifikasiDetail as Sertifikasi).namaSertifikasi;
    } else if (notifikasiDetail is PelatihanUser) {
      return (notifikasiDetail as dynamic)
          .namaPelatihan; // Gunakan dynamic jika tipe berbeda
    }
    return "Detail Tidak Dikenal";
  }

  // Menampilkan detail Sertifikasi
  List<Widget> _buildSertifikasiDetail(Sertifikasi sertifikasi) {
    return [
      buildDetailItem("Jenis Sertifikasi:", sertifikasi.jenis),
      buildDetailItem("Tanggal:",
          DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(sertifikasi.tanggal)),
      buildDetailItem(
          "Masa Berlaku:",
          DateFormat('EEEE, dd-MM-yyyy', 'id_ID')
              .format(sertifikasi.masaBerlaku)),
      buildDetailItem("Biaya:", sertifikasi.biaya),
      buildDetailItem("Vendor:", sertifikasi.vendorSertifikasi.nama),
      buildDetailItem("Jenis Bidang Sertifikasi:",
          sertifikasi.jenisSertifikasi.namaJenisSertifikasi),
      buildDetailItem(
          "Bidang Minat:",
          sertifikasi.bidangMinatSertifikasi.isEmpty
              ? "Tidak ada"
              : sertifikasi.bidangMinatSertifikasi
                  .map((e) => e.namaBidangMinat)
                  .join(", ")),
      buildDetailItem(
          "Mata Kuliah:",
          sertifikasi.mataKuliahSertifikasi.isEmpty
              ? "Tidak ada"
              : sertifikasi.mataKuliahSertifikasi
                  .map((e) => e.namaMatakuliah)
                  .join(", ")),
    ];
  }

  // Menampilkan detail Pelatihan
  List<Widget> _buildPelatihanDetail(PelatihanUser pelatihan) {
    return [
      buildDetailItem("Nama Pelatihan:", pelatihan.namaPelatihan),
      buildDetailItem("Tanggal:",
          DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(pelatihan.tanggal)),
      buildDetailItem("Biaya:", pelatihan.biaya),
      buildDetailItem("Lokasi:", pelatihan.lokasi),
      buildDetailItem("Jenis Bidang Pelatihan:",
          pelatihan.jenisPelatihan.namaJenisPelatihan),
      buildDetailItem("Jenis Bidang Pelatihan:", pelatihan.levelPelatihan),
      buildDetailItem(
          "Bidang Minat:",
          pelatihan.bidangMinatPelatihan.isEmpty
              ? "Tidak ada"
              : pelatihan.bidangMinatPelatihan
                  .map((e) => e.namaBidangMinat)
                  .join(", ")),
      buildDetailItem(
          "Mata Kuliah:",
          pelatihan.mataKuliahPelatihan.isEmpty
              ? "Tidak ada"
              : pelatihan.mataKuliahPelatihan
                  .map((e) => e.namaMatakuliah)
                  .join(", ")),
    ];
  }

  // Widget untuk menampilkan detail item secara dinamis
Widget buildDetailItem(String label, String value) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$label ", // Label dengan teks tebal
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Color(0xFF375E97),
            ),
          ),
          TextSpan(
            text: value, // Value dengan teks normal
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
              color: Color(0xFF375E97),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    ),
  );
}

}
