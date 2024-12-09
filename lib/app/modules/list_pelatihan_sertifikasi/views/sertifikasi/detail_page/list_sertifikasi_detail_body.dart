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
                  'Nama Sertifikasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  sertifikasiDetail.namaSertifikasi ?? 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),
                ),
              ),
            ),

            //No Sertifikasi
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'No Sertifikasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  sertifikasiDetail.detailPesertaSertifikasi.isNotEmpty &&
                      sertifikasiDetail.detailPesertaSertifikasi[0].pivot != null
                  ? sertifikasiDetail.detailPesertaSertifikasi[0].pivot!.noSertifikasi
                  : 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),
                ),
              ),
            ),

            //Vendor Sertifikasi
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Vendor Sertifikasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  sertifikasiDetail.vendorSertifikasi?.nama ?? 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),),
              ),
            ),

            //Jenis Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Jenis Sertifikasi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
              subtitle: Text(
                sertifikasiDetail.jenis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
            ),
          ),


            //Jenis Bidang Sertifikasi
            Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Jenis Bidang',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
              subtitle: Text(
                sertifikasiDetail.jenisSertifikasi.namaJenisSertifikasi,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
            ),
          ),

          //Tahun Periode Sertifikasi
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
                  sertifikasiDetail.periode.tahunPeriode,
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
                  'Tanggal Sertifikasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  sertifikasiDetail.tanggal?.toLocal().toString() ?? 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Masa Berlaku Sertifikasi
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Masa Berlaku',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                  sertifikasiDetail.masaBerlaku?.toLocal().toString().split(" ")[0] ?? 'Tidak tersedia',
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
                  sertifikasiDetail.biaya?.isNotEmpty == true ? sertifikasiDetail.biaya : 'Tidak tersedia',
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
                   sertifikasiDetail.bidangMinatSertifikasi.isNotEmpty
                    ? sertifikasiDetail.bidangMinatSertifikasi
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
                  sertifikasiDetail.mataKuliahSertifikasi.isNotEmpty
                  ? sertifikasiDetail.mataKuliahSertifikasi.map((e) => e.namaMatakuliah).join(", ")
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
                  sertifikasiDetail.detailPesertaSertifikasi.isNotEmpty
                      ? sertifikasiDetail.detailPesertaSertifikasi
                          .map((e) => e.namaLengkap)
                          .join(", ")
                      : 'Tidak tersedia',
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
