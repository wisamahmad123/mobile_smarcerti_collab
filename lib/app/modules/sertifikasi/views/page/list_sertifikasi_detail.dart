import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';

class ListSertifikasiDetail extends StatefulWidget {
  final int idSertifikasi;

  const ListSertifikasiDetail({Key? key, required this.idSertifikasi}) : super(key: key);

  @override
  _ListSertifikasiDetailState createState() => _ListSertifikasiDetailState();
}

class _ListSertifikasiDetailState extends State<ListSertifikasiDetail> {
  final SertifikasiController controller = Get.put(SertifikasiController());
  final PdfService pdfService = PdfService(); // Inisialisasi PdfService

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadSertifikasiById(widget.idSertifikasi);
    });
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
              if (sertifikasi.detailPesertaSertifikasi.isNotEmpty &&
                  sertifikasi.detailPesertaSertifikasi[0].pivot != null)
                GestureDetector(
                  onTap: () async {
                    final fileName =
                        sertifikasi.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi ?? 'tidak tersedia';
                    final fileUrl =
                        'http://192.168.100.122:8000/storage/bukti_sertifikasi/$fileName'; // Ganti dengan URL server Anda
                    if (fileName != 'tidak tersedia') {
                      final controller = Get.find<SertifikasiController>();
                      await controller.downloadPdf(fileName, fileUrl); // Panggil dengan fileName dan fileUrl
                    } else {
                      Get.snackbar(
                        "Error",
                        "File bukti sertifikasi tidak tersedia.",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.picture_as_pdf, color: Color.fromARGB(255, 55, 94, 151)),
                      const SizedBox(width: 8),
                      Text(
                        sertifikasi.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi ?? 'Tidak tersedia',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 55, 94, 151),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
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