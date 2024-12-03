import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_sertifikasi.dart';

class ListSertifikasiDetailBody extends StatelessWidget {
  final Sertifikasi sertifikasiDetail; // Objek detail pelatihan

  ListSertifikasiDetailBody({
    super.key,
    required this.sertifikasiDetail,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Pelatihan
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              sertifikasiDetail.namaSertifikasi,
              maxLines: 3,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF375E97),
              ),
            ),
          ),
          // Deskripsi Pelatihan
          buildDetailItem("Jenis:", sertifikasiDetail.jenis),
          buildDetailItem("Kuota:", sertifikasiDetail.kuotaPeserta),
          buildDetailItem(
              "Tanggal:", sertifikasiDetail.tanggal.toLocal().toString()),
          buildDetailItem("Masa Berlaku:",
              sertifikasiDetail.masaBerlaku.toLocal().toString()),
          buildDetailItem("Biaya:", sertifikasiDetail.biaya),
          buildDetailItem("Vendor:", sertifikasiDetail.vendorSertifikasi.nama),
          buildDetailItem("Jenis Sertifikasi:",
              sertifikasiDetail.jenisSertifikasi.namaJenisSertifikasi),
          buildDetailItem(
              "Bidang Minat:",
              sertifikasiDetail.bidangMinatSertifikasi.isEmpty
                  ? "Tidak ada"
                  : sertifikasiDetail.bidangMinatSertifikasi
                      .map((e) => e.namaBidangMinat)
                      .join(", ")),
          buildDetailItem(
              "Mata Kuliah:",
              sertifikasiDetail.mataKuliahSertifikasi.isEmpty
                  ? "Tidak ada"
                  : sertifikasiDetail.mataKuliahSertifikasi
                      .map((e) => e.namaMatakuliah)
                      .join(", ")),
          buildDetailItem(
              "Nama Peserta:",
              sertifikasiDetail.detailPesertaSertifikasi.isEmpty
                  ? "Tidak ada"
                  : sertifikasiDetail.detailPesertaSertifikasi
                      .map((e) => e.namaLengkap)
                      .join(", ")),
          buildDetailItem(
              "Bukti Sertifikasi:",
              sertifikasiDetail.detailPesertaSertifikasi.isEmpty
                  ? "Tidak ada"
                  : sertifikasiDetail.detailPesertaSertifikasi
                      .map((e) => e.pivot?.buktiSertifikasi)
                      .join(", ")),
        ],
      ),
    );
  }

  // Widget untuk menampilkan detail item secara dinamis
  Widget buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "$label $value",
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          color: Color(0xFF375E97),
        ),
      ),
    );
  }
}
