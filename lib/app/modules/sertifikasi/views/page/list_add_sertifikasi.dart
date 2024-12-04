import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';

class ListAddSertifikasi extends StatefulWidget {
  const ListAddSertifikasi({Key? key}) : super(key: key);

  @override
  _ListAddSertifikasiState createState() => _ListAddSertifikasiState();
}

class _ListAddSertifikasiState extends State<ListAddSertifikasi> {
  final SertifikasiController sertifikasiController =
      Get.put(SertifikasiController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaSertifikasiController =
      TextEditingController();
  final TextEditingController noSertifikasiController = TextEditingController();
  final TextEditingController biayaController = TextEditingController();
  final TextEditingController masaBerlakuController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController buktiSertifikasiController =
      TextEditingController();
  final TextEditingController kuotaController =
      TextEditingController(text: '1');

  File? file;
  String? selectedVendor;
  String? selectedJenisBidang;
  String? selectedJenis;
  String? selectedTahunPeriode;
  List<String> selectedBidangMinat = [];
  List<String> selectedMataKuliah = [];

  final TextEditingController masaBerlaku = TextEditingController();
  final TextEditingController tanggal = TextEditingController();
  DateTime selectedDate = DateTime.now();

  static const List<String> jenisSertifikasi = [
    'Profesi',
    'Keahlian',
  ];

  Future _createBukti() async {
    MyAccountController myAccountController = Get.put(MyAccountController());

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = {
        'id_vendor_sertifikasi': selectedVendor,
        'id_jenis_sertifikasi': selectedJenisBidang,
        'id_periode': selectedTahunPeriode,
        'id_bidang_minat': selectedBidangMinat,
        'id_matakuliah': selectedMataKuliah,
        'user_id': myAccountController.myAccounts.first.id,
        'nama_sertifikasi': namaSertifikasiController.text,
        'no_sertifikasi': noSertifikasiController.text,
        'jenis': selectedJenis,
        'tanggal': tanggal.text,
        'bukti_sertifikasi': file!.path,
        'masa_berlaku': masaBerlaku.text,
        'biaya': biayaController.text,
        'kuota_peserta': kuotaController.text,
      };

      print(formData);
      sertifikasiController.createSertifikasi(formData);
    }
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

    // Memastikan data dimuat sebelum widget dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sertifikasiController.loadVendors();
      sertifikasiController.loadBidangMinat();
      sertifikasiController.loadMataKuliah();
      sertifikasiController.loadJenisSertifikasi();
      sertifikasiController.loadPeriode();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Vendor Dropdown
                Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.vendorList.isEmpty) {
                    return const Text('Vendor tidak tersedia');
                  }
                  return DropdownButtonFormField<String>(
                    value: selectedVendor,
                    decoration: const InputDecoration(labelText: 'Nama Vendor'),
                    onChanged: (value) {
                      selectedVendor = value;
                    },
                    items: sertifikasiController.vendorList.map((vendor) {
                      return DropdownMenuItem<String>(
                        value: vendor.idVendorSertifikasi
                            .toString(), // Pastikan nama sesuai dengan model VendorSertifikasi
                        child: Text(vendor.nama),
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? 'Vendor harus dipilih' : null,
                  );
                }),

                // Jenis Bidang Dropdown
                DropdownButtonFormField<String>(
                  value: selectedJenis,
                  decoration:
                      const InputDecoration(labelText: 'Jenis Sertifikasi'),
                  onChanged: (value) {
                    selectedJenis = value;
                  },
                  items: jenisSertifikasi.map((jenis) {
                    return DropdownMenuItem<String>(
                      value: jenis,
                      child: Text(jenis),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Jenis Sertifikasi harus dipilih' : null,
                ),

                Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.tahunPeriode.isEmpty) {
                    return const Text('Tahun Periode');
                  }
                  return DropdownButtonFormField<String>(
                    value: selectedTahunPeriode,
                    decoration:
                        const InputDecoration(labelText: 'Tahun Periode'),
                    onChanged: (value) {
                      selectedTahunPeriode = value;
                    },
                    items: sertifikasiController.tahunPeriode.map((periode) {
                      return DropdownMenuItem<String>(
                        value: periode.idPeriode.toString(),
                        child: Text(periode.tahunPeriode),
                      );
                    }).toList(),
                    validator: (value) => value == null
                        ? 'Jenis Sertifikasi harus dipilih'
                        : null,
                  );
                }),

                Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.jenisSertifikasiList.isEmpty) {
                    return const Text('Jenis Bidang');
                  }
                  return DropdownButtonFormField<String>(
                    value: selectedJenisBidang,
                    decoration:
                        const InputDecoration(labelText: 'Jenis Bidang'),
                    onChanged: (value) {
                      selectedJenisBidang = value;
                    },
                    items:
                        sertifikasiController.jenisSertifikasiList.map((jenis) {
                      return DropdownMenuItem<String>(
                        value: jenis.idJenisSertifikasi.toString(),
                        child: Text(jenis.namaJenisSertifikasi),
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? 'Jenis Bidang harus dipilih' : null,
                  );
                }),

                // Input lainnya
                TextFormField(
                  controller: namaSertifikasiController,
                  decoration:
                      const InputDecoration(labelText: 'Nama Sertifikasi'),
                  validator: (value) =>
                      value!.isEmpty ? 'Nama Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: noSertifikasiController,
                  decoration:
                      const InputDecoration(labelText: 'No Sertifikasi'),
                  validator: (value) =>
                      value!.isEmpty ? 'No Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: biayaController,
                  decoration:
                      const InputDecoration(labelText: 'Biaya Sertifikasi'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Biaya Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: kuotaController,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Kuota'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Kuota wajib diisi' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Masa Berlaku'),
                  readOnly: true,
                  controller: masaBerlaku,
                  onTap: () {
                    _selectDate(context, masaBerlaku);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Masa Berlaku wajib diisi' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tanggal Sertifikasi'),
                  readOnly: true,
                  controller: tanggal,
                  onTap: () {
                    _selectDate(context, tanggal);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Tanggal Sertifikasi wajib diisi' : null,
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
                          'Pilih File Bukti Sertifikasi ${file?.path.split('/').last ?? 'Belum ada file'}'),
                    ),
                  ],
                ),

                MultiSelectDialogField(
                    buttonText: const Text('Bidang Minat'),
                    title: const Text('Bidang Minat'),
                    items: sertifikasiController.bidangMinatList
                        .map((bidangMinat) => MultiSelectItem<String>(
                            bidangMinat.idBidangMinat.toString(),
                            bidangMinat.namaBidangMinat))
                        .toList(),
                    onConfirm: (val) {
                      selectedBidangMinat = val;
                    }),

                MultiSelectDialogField(
                    buttonText: const Text('Mata Kuliah'),
                    title: const Text('Mata Kuliah'),
                    items: sertifikasiController.mataKuliahList
                        .map((mataKuliah) => MultiSelectItem<String>(
                            mataKuliah.idMatakuliah.toString(),
                            mataKuliah.namaMatakuliah))
                        .toList(),
                    onConfirm: (val) {
                      selectedMataKuliah = val;
                    }),

                // Tombol Tambah Sertifikasi
                ElevatedButton(
                  onPressed: () => _createBukti(),
                  child: const Text('Tambah Sertifikasi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
