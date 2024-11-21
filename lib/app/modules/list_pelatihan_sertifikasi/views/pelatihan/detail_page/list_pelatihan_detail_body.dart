import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';

class ListPelatihanDetailBody extends StatelessWidget {
  final Pelatihan pelatihanDetail; // Objek detail pelatihan

  ListPelatihanDetailBody({
    super.key,
    required this.pelatihanDetail,
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
              pelatihanDetail.namaPelatihan,
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
          buildDetailItem("Level Pelatihan:", pelatihanDetail.levelPelatihan),
          buildDetailItem("Kuota:", pelatihanDetail.kuotaPeserta),
          buildDetailItem("Tanggal:", pelatihanDetail.tanggal.toLocal().toString()),
          buildDetailItem("Lokasi:", pelatihanDetail.lokasi),
          buildDetailItem("Biaya:", pelatihanDetail.biaya),
          buildDetailItem("Vendor:", pelatihanDetail.vendorPelatihan.nama),
          buildDetailItem("Bidang Minat:", pelatihanDetail.bidangMinatPelatihan.isEmpty
              ? "Tidak ada"
              : pelatihanDetail.bidangMinatPelatihan.map((e) => e.namaBidangMinat).join(", ")),
          buildDetailItem("Mata Kuliah:", pelatihanDetail.mataKuliahPelatihan.isEmpty
              ? "Tidak ada"
              : pelatihanDetail.mataKuliahPelatihan.map((e) => e.namaMatakuliah).join(", ")),
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
