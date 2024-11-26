import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ListSertifikasiDetail extends StatefulWidget {
  final int idSertifikasi;

  const ListSertifikasiDetail({Key? key, required this.idSertifikasi}) : super(key: key);

  @override
  _ListSertifikasiDetailState createState() => _ListSertifikasiDetailState();
}

class _ListSertifikasiDetailState extends State<ListSertifikasiDetail> {
  final SertifikasiController controller = Get.put(SertifikasiController());

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Kode yang membutuhkan update setelah build selesai
    controller.loadSertifikasiById(widget.idSertifikasi);
  });
}


  Future<void> _openPdf(String fileName) async {
    final Uri fileUrl = Uri.parse("http://192.168.110.220:8000/storage/bukti_sertifikasi$fileName"); // Pastikan fileUrl adalah Uri

    if (await canLaunchUrl(fileUrl)) {
      await launchUrl(
        fileUrl,
        mode: LaunchMode.externalApplication,
      );
    } else {
      print("Tidak dapat membuka file PDF: $fileUrl");
      Get.snackbar(
        "Error",
        "Tidak dapat membuka file PDF",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final sertifikasi = controller.sertifikasiDetail.value;

        if (sertifikasi == null) {
          return const Center(
            child: Text('Detail sertifikasi tidak ditemukan.'),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                sertifikasi.namaSertifikasi,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
              const SizedBox(height: 10),
              _buildDetailText('Vendor', sertifikasi.vendorSertifikasi.nama),
              _buildDetailText('Jenis Bidang', sertifikasi.jenisSertifikasi.namaJenisSertifikasi),
              _buildDetailText('Tanggal Sertifikasi', sertifikasi.tanggal?.toLocal().toString()),
              _buildDetailText('Tahun Periode', sertifikasi.periode.tahunPeriode),
              _buildDetailText('Biaya', sertifikasi.biaya.isNotEmpty ? sertifikasi.biaya : 'Tidak tersedia'),
              _buildDetailText(
                'No Sertifikasi',
                sertifikasi.detailPesertaSertifikasi.isNotEmpty &&
                        sertifikasi.detailPesertaSertifikasi[0].pivot != null
                    ? sertifikasi.detailPesertaSertifikasi[0].pivot!.noSertifikasi
                    : 'Tidak tersedia',
              ),
              _buildDetailText('Jenis Sertifikasi', sertifikasi.jenis),
              _buildDetailText(
                'Masa Berlaku',
                sertifikasi.masaBerlaku?.toLocal().toString().split(" ")[0],
              ),
              _buildDetailText(
                'Bidang Minat',
                sertifikasi.bidangMinatSertifikasi.isNotEmpty
                    ? sertifikasi.bidangMinatSertifikasi.map((e) => e.namaBidangMinat).join(", ")
                    : 'Tidak tersedia',
              ),
              _buildDetailText(
                'Mata Kuliah',
                sertifikasi.mataKuliahSertifikasi.isNotEmpty
                    ? sertifikasi.mataKuliahSertifikasi.map((e) => e.namaMatakuliah).join(", ")
                    : 'Tidak tersedia',
              ),
              const SizedBox(height: 10),
             // Bukti Sertifikasi (PDF) with Icon
              if (sertifikasi.detailPesertaSertifikasi.isNotEmpty && sertifikasi.detailPesertaSertifikasi[0].pivot != null)
                GestureDetector(
                  onTap: () async {
                    final baseUrl = "http://192.168.110.220:8000/storage/bukti_sertifikasi"; // Base URL untuk file PDF
                    final fileName = sertifikasi.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi;
                    final fileUrl = "$baseUrl/$fileName";

                    if (await canLaunch(fileUrl)) {
                      await launch(fileUrl); // Membuka file di browser atau aplikasi PDF.
                    } else {
                      print("Tidak dapat membuka file PDF: $fileUrl");
                      Get.snackbar(
                        "Error",
                        "Tidak dapat membuka file PDF",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.withOpacity(0.7),
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.picture_as_pdf, // Menambahkan ikon PDF
                        color: Color.fromARGB(255, 55, 94, 151),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        sertifikasi.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi, // Menggunakan nama file sebagai teks
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 55, 94, 151),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDetailText(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        '$label: ${value ?? '$label tidak tersedia'}',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 55, 94, 151), // Warna teks diubah di sini
        ),
      ),
    );
  }
}
