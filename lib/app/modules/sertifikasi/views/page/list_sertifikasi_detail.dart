import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/pdf_viewer_page.dart'; // Add this import
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_add_bukti.dart'; // Add this import

class ListSertifikasiDetail extends StatefulWidget {
  final int idSertifikasi;

  const ListSertifikasiDetail({Key? key, required this.idSertifikasi})
      : super(key: key);

  @override
  _ListSertifikasiDetailState createState() => _ListSertifikasiDetailState();
}

class _ListSertifikasiDetailState extends State<ListSertifikasiDetail> {
  final SertifikasiController controller = Get.put(SertifikasiController());
  final PdfService pdfService = PdfService(); // Inisialisasi PdfService

  String remotePDFpath = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadSertifikasiById(widget.idSertifikasi);
    });

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final sertifikasi = controller.sertifikasiDetail.value;
      final fileName =
          sertifikasi!.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi ??
              '';
      const hostname = ApiConstants.hostname;
      final filename = fileName.substring(fileName.lastIndexOf("/") + 1);
      final url =
          '${hostname}storage/bukti_sertifikasi/$filename'; // Ganti dengan URL server Anda";
      print(url);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
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

        print(sertifikasi);

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
              _buildDetailText('Jenis Bidang',
                  sertifikasi.jenisSertifikasi.namaJenisSertifikasi),
              _buildDetailText('Tanggal Sertifikasi',
                  sertifikasi.tanggal?.toLocal().toString()),
              _buildDetailText(
                  'Tahun Periode', sertifikasi.periode.tahunPeriode),
              _buildDetailText(
                  'Biaya',
                  sertifikasi.biaya.isNotEmpty
                      ? sertifikasi.biaya
                      : 'Tidak tersedia'),
              _buildDetailText(
                'No Sertifikasi',
                sertifikasi.detailPesertaSertifikasi.isNotEmpty &&
                        sertifikasi.detailPesertaSertifikasi[0].pivot != null
                    ? sertifikasi
                        .detailPesertaSertifikasi[0].pivot!.noSertifikasi
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
                    ? sertifikasi.bidangMinatSertifikasi
                        .map((e) => e.namaBidangMinat)
                        .join(", ")
                    : 'Tidak tersedia',
              ),
              _buildDetailText(
                'Mata Kuliah',
                sertifikasi.mataKuliahSertifikasi.isNotEmpty
                    ? sertifikasi.mataKuliahSertifikasi
                        .map((e) => e.namaMatakuliah)
                        .join(", ")
                    : 'Tidak tersedia',
              ),
              const SizedBox(height: 10),
              // Bukti Sertifikasi (PDF) with Icon
              FutureBuilder(
                  future: createFileOfPdfUrl(),
                  builder: (context, snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = [
                        GestureDetector(
                          onTap: () async {
                            if (remotePDFpath != "") {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PdfViewerPage(pdfFilePath: remotePDFpath),
                                ),
                              );
                            } else {
                              Get.snackbar(
                                "Error",
                                "File bukti sertifikasi tidak tersedia.",
                                backgroundColor: Colors.redAccent,
                                colorText: Colors.white,
                              );
                            }

                            // final fileName = sertifikasi.detailPesertaSertifikasi[0]
                            //         .pivot!.buktiSertifikasi ??
                            //     'tidak tersedia';
                            // final fileUrl =
                            //     'http://192.168.100.122:8000/storage/bukti_sertifikasi/$fileName'; // Ganti dengan URL server Anda
                            // if (fileName != 'tidak tersedia') {
                            //   final controller = Get.find<SertifikasiController>();
                            //   await controller.downloadPdf(fileName,
                            //       fileUrl); // Panggil dengan fileName dan fileUrl
                            // } else {
                            //   Get.snackbar(
                            //     "Error",
                            //     "File bukti sertifikasi tidak tersedia.",
                            //     backgroundColor: Colors.redAccent,
                            //     colorText: Colors.white,
                            //   );
                            // }
                          },
                          child: Row(
                            children: [
                              Icon(Icons.picture_as_pdf,
                                  color: Color.fromARGB(255, 55, 94, 151)),
                              const SizedBox(width: 8),
                              Text(
                                // sertifikasi.detailPesertaSertifikasi[0].pivot!
                                //         .buktiSertifikasi
                                'Lihat Sertifikasi' ?? 'Tidak tersedia',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 55, 94, 151),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        )
                      ];
                    } else {
                      children = <Widget>[
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListAddBukti(
                                          idSertifikasi: widget.idSertifikasi),
                                    ),
                                  )
                                },
                            child: Text('Upload Bukti Sertifikasi')),
                      ];
                    }
                    return Column(
                      children: children,
                    );
                  })
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
