import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:file_picker/file_picker.dart';

class ListAddBukti extends StatefulWidget {
  final int idSertifikasi;

  const ListAddBukti({Key? key, required this.idSertifikasi}) : super(key: key);

  @override
  _ListAddBuktiState createState() => _ListAddBuktiState();
}

class _ListAddBuktiState extends State<ListAddBukti> {
  final SertifikasiController controller = Get.put(SertifikasiController());

  final TextEditingController noSertifikasiController = TextEditingController();
  final TextEditingController masaBerlaku = TextEditingController();
  final TextEditingController tanggal = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? file;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadSertifikasiById(widget.idSertifikasi);
    });
  }

  Future _updateBukti() async {
    final sertifikasi = controller.sertifikasiDetail.value;

    Map<String, dynamic> formData = {
      'id_vendor_sertifikasi': sertifikasi!.idVendorSertifikasi,
      'id_jenis_sertifikasi': sertifikasi.idJenisSertifikasi,
      'id_periode': sertifikasi.idPeriode,
      'id_bidang_minat': sertifikasi.bidangMinatSertifikasi.first.idBidangMinat,
      'id_matakuliah': sertifikasi.mataKuliahSertifikasi.first.idMatakuliah,
      'user_id': sertifikasi.detailPesertaSertifikasi.first.userId,
      'nama_sertifikasi': sertifikasi.namaSertifikasi,
      'no_sertifikasi': noSertifikasiController.text,
      'jenis': sertifikasi.jenis,
      'tanggal': tanggal.text,
      'bukti_sertifikasi': file!.path,
      'masa_berlaku': masaBerlaku.text,
      'biaya': sertifikasi.biaya,
      'kuota_peserta': sertifikasi.kuotaPeserta,
    };

    controller.updateSertifikasi(widget.idSertifikasi, formData);
  }

  @override
  Widget build(BuildContext context) {
    _selectDate(BuildContext context, controller) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          controller.text = picked.toString().split(' ')[0];
        });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Bukti Sertifikasi'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: noSertifikasiController,
                    decoration: InputDecoration(labelText: 'No Sertifikasi'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Masa Berlaku'),
                    readOnly: true,
                    controller: masaBerlaku,
                    onTap: () {
                      _selectDate(context, masaBerlaku);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Tanggal'),
                    readOnly: true,
                    controller: tanggal,
                    onTap: () {
                      _selectDate(context, tanggal);
                    },
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf']);

                          if (result != null) {
                            setState(() {
                              file = File(result.files.single.path!);
                            });
                            print(file);
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Text(
                            'Pilih File ${file?.path.split('/').last ?? 'Belum ada file'}'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _updateBukti();
                      Navigator.pop(context);
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
