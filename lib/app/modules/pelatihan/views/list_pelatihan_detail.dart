import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/add_bukti_page.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/pdf_viewer_page.dart'; 

class ListPelatihanDetail extends StatefulWidget {
  final int idPelatihan;

  const ListPelatihanDetail({Key? key, required this.idPelatihan})
      : super(key: key);

  @override
  _ListPelatihanDetailState createState() => _ListPelatihanDetailState();
}

class _ListPelatihanDetailState extends State<ListPelatihanDetail> {
  final PelatihanController controller = Get.put(PelatihanController());
  final PdfService pdfService = PdfService(); // Inisialisasi PdfService

  String remotePDFpath = "";

  @override
  void initState() {
    super.initState();
    initData();
    
  }

  Future<void> initData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadPelatihanById(widget.idPelatihan);
      if (controller.pelatihanDetail.value != null &&
          controller.pelatihanDetail.value!.detailPesertaPelatihan.isNotEmpty) {
        String? buktiPelatihan =
            controller.pelatihanDetail.value!.detailPesertaPelatihan[0].pivot!.buktiPelatihan;
        if (buktiPelatihan != null && buktiPelatihan.isNotEmpty) {
          createFileOfPdfUrl().then((f) {
            setState(() {
              remotePDFpath = f.path;
            });
          });
        }
      }
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      final pelatihan = controller.pelatihanDetail.value;
      final fileName = pelatihan!.detailPesertaPelatihan[0].pivot!.buktiPelatihan ?? '';
      final url = '${ApiConstants.hostname}storage/bukti_pelatihan/$fileName';

      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        File file = File("${dir.path}/$fileName");
        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
      } else {
        completer.completeError('Failed to load PDF');
      }
    } catch (e) {
      completer.completeError('Error downloading file: $e');
    }
    return completer.future;
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      completer.completeError('Error parsing asset file!');
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
              //Nama Pelatihan
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
                  pelatihan.namaPelatihan ?? 'Tidak tersedia',
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 55, 94, 151)),
                ),
              ),
            ),

            //Vendor
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
                   pelatihan.vendorPelatihan.nama ?? 'Tidak tersedia',
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
                pelatihan.levelPelatihan,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 55, 94, 151),
                ),
              ),
            ),
          ),

          //Jenis Bidang Pelatihan
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
                pelatihan.jenisPelatihan.namaJenisPelatihan,
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
                  pelatihan.periode.tahunPeriode,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

          //Tanggal Pelatihan
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
                  pelatihan.tanggal?.toLocal().toString() ?? 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            //Lokasi
             Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'Lokasi',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
                subtitle: Text(
                 pelatihan.lokasi ?? 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),
            //Biaya
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
                  pelatihan.biaya?.isNotEmpty == true ? pelatihan.biaya : 'Tidak tersedia',
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
                   pelatihan.bidangMinatPelatihan.isNotEmpty
                    ? pelatihan.bidangMinatPelatihan
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
                  pelatihan.mataKuliahPelatihan.isNotEmpty
                    ? pelatihan.mataKuliahPelatihan
                        .map((e) => e.namaMatakuliah)
                        .join(", ")
                  : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),

            // Bukti Pelatihan
          Column(
            children: [
              // Jika ada file PDF, tampilkan file tersebut dalam Card
              if (remotePDFpath.isNotEmpty) ...[
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerPage(pdfFilePath: remotePDFpath),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.picture_as_pdf,
                        color: Color.fromARGB(255, 55, 94, 151),
                        size: 30,
                      ),
                      title: Text(
                        remotePDFpath.split('/').last,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 55, 94, 151),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

               const SizedBox(height: 20),

          // Tombol untuk upload bukti sertifikasi, tetap di luar Card
          SizedBox(
          width: 150, // Mengatur lebar tombol
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBuktiPage(idPelatihan: widget.idPelatihan),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8,),
              backgroundColor: const Color.fromARGB(255, 239, 84, 40), // Warna latar belakang tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Membuat sudut tombol melengkung
              ),
            ),
            child: const Text(
              'Upload Bukti',
              style: TextStyle(
                color: Colors.white, // Warna teks tombol
                fontSize: 16, // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan font
              ),
            ),
          ),
        ),
            ]
          ),


              const SizedBox(height: 20),
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
