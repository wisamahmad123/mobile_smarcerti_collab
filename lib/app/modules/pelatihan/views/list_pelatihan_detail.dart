import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPelatihanDetail extends StatefulWidget {
  final int idPelatihan;

  const ListPelatihanDetail({Key? key, required this.idPelatihan})
      : super(key: key);

  @override
  _ListPelatihanDetailState createState() => _ListPelatihanDetailState();
}

class _ListPelatihanDetailState extends State<ListPelatihanDetail> {
  final PelatihanController controller = Get.put(PelatihanController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Muat data detail pelatihan setelah build selesai
      controller.loadPelatihanById(widget.idPelatihan);
    });
  }

  Future<void> _openPdf(String fileName) async {
    final Uri fileUrl = Uri.parse(
        "http://192.168.110.220:8000/storage/bukti_pelatihan/$fileName");

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

        final pelatihan = controller.pelatihanDetail.value;

        if (pelatihan == null) {
          return const Center(
            child: Text('Detail pelatihan tidak ditemukan.'),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                pelatihan.namaPelatihan,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 94, 151), //warna
                ),
              ),
              const SizedBox(height: 10),
              _buildDetailText('Vendor', pelatihan.vendorPelatihan.nama),
              _buildDetailText(
                  'Jenis Bidang', pelatihan.jenisPelatihan.namaJenisPelatihan),
              _buildDetailText(
                  'Tanggal Pelatihan', pelatihan.tanggal?.toLocal().toString()),
              _buildDetailText('Tahun Periode', pelatihan.periode.tahunPeriode),
              _buildDetailText(
                  'Biaya',
                  pelatihan.biaya.isNotEmpty
                      ? pelatihan.biaya
                      : 'Tidak tersedia'),
              _buildDetailText('Level Pelatihan', pelatihan.levelPelatihan),
              _buildDetailText('Lokasi', pelatihan.lokasi),
              _buildDetailText(
                'Bidang Minat',
                pelatihan.bidangMinatPelatihan.isNotEmpty
                    ? pelatihan.bidangMinatPelatihan
                        .map((e) => e.namaBidangMinat)
                        .join(", ")
                    : 'Tidak tersedia',
              ),
              _buildDetailText(
                'Mata Kuliah',
                pelatihan.mataKuliahPelatihan.isNotEmpty
                    ? pelatihan.mataKuliahPelatihan
                        .map((e) => e.namaMatakuliah)
                        .join(", ")
                    : 'Tidak tersedia',
              ),
              const SizedBox(height: 10),
              // Bukti Pelatihan (PDF) dengan ikon
              // if (pelatihan.detailPesertaPelatihan.isNotEmpty != null && pelatihan.detailPesertaPelatihan!.isNotEmpty)
              //   GestureDetector(
              //     onTap: () async {
              //       final baseUrl = "http://192.168.110.220:8000/storage/bukti_pelatihan"; // Base URL untuk file PDF
              //       final fileName = pelatihan.detailPesertaPelatihan[0].pivot!.buktiPelatihan;
              //       final fileUrl = "$baseUrl/$fileName";

              //       if (await canLaunch(fileUrl)) {
              //         await launch(fileUrl); // Membuka file di browser atau aplikasi PDF.
              //       } else {
              //         print("Tidak dapat membuka file PDF: $fileUrl");
              //         Get.snackbar(
              //           "Error",
              //           "Tidak dapat membuka file PDF",
              //           snackPosition: SnackPosition.BOTTOM,
              //           backgroundColor: Colors.red.withOpacity(0.7),
              //           colorText: Colors.white,
              //         );
              //       }
              //     },
              
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.picture_as_pdf, // Menambahkan ikon PDF
              //           color: Color.fromARGB(255, 55, 94, 151),
              //         ),
              //         const SizedBox(width: 8),
              //         Text(
              //           pelatihan.detailPesertaPelatihan[0].pivot!.buktiPelatihan, // Menggunakan nama file sebagai teks
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Color.fromARGB(255, 55, 94, 151),
              //             decoration: TextDecoration.underline,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
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
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 55, 94, 151), // Warna teks hijau
        ),
      ),
    );
  }
}
