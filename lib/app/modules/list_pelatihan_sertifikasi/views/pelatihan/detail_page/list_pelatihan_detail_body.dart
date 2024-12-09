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
    return Container(
      color: Colors.white, // Menetapkan background putih
      child: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           //Nama Sertifikasi
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Nama Pelatihan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.namaPelatihan ?? 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),
                ),
              ),
            ),

            //Vendor Pelatihan
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Vendor Pelatihan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.vendorPelatihan.nama ?? 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),),
              ),
            ),

            //Level Pelatihan 
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Level Pelatihan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
              subtitle: Text(
                pelatihanDetail.levelPelatihan,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
            ),
          ),

          //Jenis Bidang pelatihan
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Jenis Pelatihan',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.jenisPelatihan.namaJenisPelatihan,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),
          //Tahun Periode
           Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Tahun Periode',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.periode.tahunPeriode,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),
        
          //Tanggal Sertifikasi
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Tanggal Pelatihan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.tanggal?.toLocal().toString() ?? 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Kuota Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Kuota',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.kuotaPeserta?.isNotEmpty == true ? pelatihanDetail.kuotaPeserta : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Biaya Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Biaya',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.biaya?.isNotEmpty == true ? pelatihanDetail.biaya : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Bidang Minat Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Bidang Minat',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                   pelatihanDetail.bidangMinatPelatihan.isEmpty
                    ? pelatihanDetail.bidangMinatPelatihan
                        .map((e) => e.namaBidangMinat)
                        .join(", ")
                    : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Mata Kuliah Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Mata Kuliah',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.mataKuliahPelatihan.isEmpty
                  ? pelatihanDetail.mataKuliahPelatihan.map((e) => e.namaMatakuliah).join(", ")
                  : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            // Nama Peserta
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Nama Peserta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  pelatihanDetail.detailPesertaPelatihan.isEmpty
                      ? 'Tidak tersedia'
                      : pelatihanDetail.detailPesertaPelatihan
                          .map((e) => e.namaLengkap)
                          .join(", "),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),


        ],
      ),
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
