import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/add_bukti_page.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/pdf_viewer_page.dart'; // Import PdfViewerPage
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_add_bukti.dart'; // Import ListAddBukti

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
    initData();
  }

  Future<void> initData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadSertifikasiById(widget.idSertifikasi);
      if (controller.sertifikasiDetail.value != null &&
          controller.sertifikasiDetail.value!.detailPesertaSertifikasi.isNotEmpty) {
        String? buktiSertifikasi =
            controller.sertifikasiDetail.value!.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi;
        if (buktiSertifikasi != null && buktiSertifikasi.isNotEmpty) {
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
      final sertifikasi = controller.sertifikasiDetail.value;
      final fileName = sertifikasi!.detailPesertaSertifikasi[0].pivot!.buktiSertifikasi ?? '';
      final url = '${ApiConstants.hostname}storage/bukti_sertifikasi/$fileName';

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

      final sertifikasi = controller.sertifikasiDetail.value;

      if (sertifikasi == null) {
        return const Center(child: Text('Detail sertifikasi tidak ditemukan.'));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Informasi Sertifikasi
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
                  sertifikasi.namaSertifikasi ?? 'Tidak tersedia',
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
                  sertifikasi.detailPesertaSertifikasi.isNotEmpty &&
                      sertifikasi.detailPesertaSertifikasi[0].pivot != null
                  ? sertifikasi.detailPesertaSertifikasi[0].pivot!.noSertifikasi
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
                  sertifikasi.vendorSertifikasi?.nama ?? 'Tidak tersedia',
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
                sertifikasi.jenis,
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
                sertifikasi.jenisSertifikasi.namaJenisSertifikasi,
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
                  sertifikasi.periode.tahunPeriode,
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
                  sertifikasi.tanggal?.toLocal().toString() ?? 'Tidak tersedia',
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
                  sertifikasi.masaBerlaku?.toLocal().toString().split(" ")[0] ?? 'Tidak tersedia',
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
                  sertifikasi.biaya?.isNotEmpty == true ? sertifikasi.biaya : 'Tidak tersedia',
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
                   sertifikasi.bidangMinatSertifikasi.isNotEmpty
                    ? sertifikasi.bidangMinatSertifikasi
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
                  sertifikasi.mataKuliahSertifikasi.isNotEmpty
                  ? sertifikasi.mataKuliahSertifikasi.map((e) => e.namaMatakuliah).join(", ")
                  : 'Tidak tersedia',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ),
            ),
            
          // Bukti Sertifikasi
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
                  builder: (context) => AddBuktiPage(idSertifikasi: widget.idSertifikasi),
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

    
  ],
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
          color: Color.fromARGB(255, 55, 94, 151),
        ),
      ),
    );
  }
}
