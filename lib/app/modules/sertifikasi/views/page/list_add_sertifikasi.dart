import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';

class ListAddSertifikasi extends StatelessWidget {
  final SertifikasiController sertifikasiController = Get.put(SertifikasiController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaSertifikasiController = TextEditingController();
  final TextEditingController noSertifikasiController = TextEditingController();
  final TextEditingController biayaController = TextEditingController();
  final TextEditingController masaBerlakuController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController buktiSertifikasiController = TextEditingController();

  String? selectedVendor;
  String? selectedJenisBidang;
  String? selectedJenis;
  List<String> selectedBidangMinat = [];
  List<String> selectedMataKuliah = [];

  @override
  Widget build(BuildContext context) {
    // Memastikan data dimuat sebelum widget dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sertifikasiController.loadVendors();
      sertifikasiController.loadBidangMinat();
      sertifikasiController.loadMataKuliah();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Sertifikasi'),
      ),
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
                        value: vendor.nama, // Pastikan nama sesuai dengan model VendorSertifikasi
                        child: Text(vendor.nama),
                      );
                    }).toList(),
                    validator: (value) => value == null ? 'Vendor harus dipilih' : null,
                  );
                }),

                // Jenis Bidang Dropdown
                Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.bidangMinatList.isEmpty) {
                    return const Text('Bidang Minat tidak tersedia');
                  }
                  return DropdownButtonFormField<String>(
                    value: selectedJenisBidang,
                    decoration: const InputDecoration(labelText: 'Jenis Bidang'),
                    onChanged: (value) {
                      selectedJenisBidang = value;
                    },
                    items: sertifikasiController.bidangMinatList.map((bidang) {
                      return DropdownMenuItem<String>(
                        value: bidang.namaBidangMinat, // Pastikan sesuai dengan model
                        child: Text(bidang.namaBidangMinat),
                      );
                    }).toList(),
                    validator: (value) => value == null ? 'Jenis Bidang harus dipilih' : null,
                  );
                }),

              
                

                // Input lainnya
                TextFormField(
                  controller: namaSertifikasiController,
                  decoration: const InputDecoration(labelText: 'Nama Sertifikasi'),
                  validator: (value) => value!.isEmpty ? 'Nama Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: noSertifikasiController,
                  decoration: const InputDecoration(labelText: 'No Sertifikasi'),
                  validator: (value) => value!.isEmpty ? 'No Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: biayaController,
                  decoration: const InputDecoration(labelText: 'Biaya Sertifikasi'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Biaya Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: masaBerlakuController,
                  decoration: const InputDecoration(labelText: 'Masa Berlaku'),
                  validator: (value) => value!.isEmpty ? 'Masa Berlaku wajib diisi' : null,
                ),
                TextFormField(
                  controller: tanggalController,
                  decoration: const InputDecoration(labelText: 'Tanggal Sertifikasi'),
                  validator: (value) => value!.isEmpty ? 'Tanggal Sertifikasi wajib diisi' : null,
                ),
                TextFormField(
                  controller: buktiSertifikasiController,
                  decoration: const InputDecoration(labelText: 'Bukti Sertifikasi'),
                  validator: (value) => value!.isEmpty ? 'Bukti Sertifikasi wajib diisi' : null,
                ),

                // Tombol Tambah Sertifikasi
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> formData = {
                        'vendor': selectedVendor,
                        'jenis_bidang': selectedJenisBidang,
                        'jenis': selectedJenis,
                        'tanggal': tanggalController.text,
                        'bukti_sertifikasi': buktiSertifikasiController.text,
                        'masa_berlaku': masaBerlakuController.text,
                        'nama_sertifikasi': namaSertifikasiController.text,
                        'no_sertifikasi': noSertifikasiController.text,
                        'biaya': biayaController.text,
                        'tag_bidang_minat': selectedBidangMinat,
                        'tag_mata_kuliah': selectedMataKuliah,
                      };
                      sertifikasiController.createSertifikasi(formData);
                    }
                  },
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
