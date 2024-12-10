import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';

class ListAddPelatihan extends StatefulWidget {
  const ListAddPelatihan({Key? key}) : super(key: key);

  @override
  _ListAddPelatihanState createState() => _ListAddPelatihanState();
}

class _ListAddPelatihanState extends State<ListAddPelatihan> {
  final PelatihanController pelatihanController =
      Get.put(PelatihanController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaPelatihanController = TextEditingController();
  final TextEditingController noPelatihanController = TextEditingController();
  final TextEditingController biayaController = TextEditingController();
  final TextEditingController masaBerlakuController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController buktiPelatihanController =
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

  static const List<String> jenisPelatihan = [
    'Profesi',
    'Keahlian',
  ];

  Future _createBukti() async {
    MyAccountController myAccountController = Get.put(MyAccountController());

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = {
        'id_vendor_pelatihan': selectedVendor,
        'id_jenis_pelatihan': selectedJenisBidang,
        'id_periode': selectedTahunPeriode,
        'id_bidang_minat': selectedBidangMinat,
        'id_matakuliah': selectedMataKuliah,
        'user_id': myAccountController.myAccounts.first.id,
        // 'nama_pelatihan': namaPelatihanController.text,
        // 'no_pelatihan': noPelatihanController.text,
        'jenis': selectedJenis,
        'tanggal': tanggal.text,
        'bukti_pelatihan': file!.path,
        'masa_berlaku': masaBerlaku.text,
        'biaya': biayaController.text,
        'kuota_peserta': kuotaController.text,
      };

      print(formData);
      pelatihanController.createPelatihan(formData);
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
      pelatihanController.loadVendors();
      pelatihanController.loadBidangMinat();
      pelatihanController.loadMataKuliah();
      pelatihanController.loadJenisPelatihan();
      pelatihanController.loadPeriode();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Vendor Dropdown
                Obx(() {
                  if (pelatihanController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (pelatihanController.vendorList.isEmpty) {
                    return const Text('Vendor tidak tersedia');
                  }
                  return DropdownField(
                    label: 'Nama Vendor',
                    value: selectedVendor,
                    items: pelatihanController.vendorList.map((vendor) {
                      return DropdownMenuItem<String>(
                        value: vendor.idVendorPelatihan.toString(),
                        child: Text(vendor.nama),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedVendor = value;
                      });
                    },
                  );
                }),

                // Jenis Bidang Dropdown
                DropdownField(
                  label: 'Jenis Pelatihan',
                  value: selectedJenis,
                  items: jenisPelatihan.map((jenis) {
                    return DropdownMenuItem<String>(
                      value: jenis,
                      child: Text(jenis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJenis = value;
                    });
                  },
                ),

                Obx(() {
                  if (pelatihanController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (pelatihanController.tahunPeriode.isEmpty) {
                    return const Text('Tahun Periode tidak tersedia');
                  }
                  return DropdownField(
                    label: 'Tahun Periode',
                    value: selectedTahunPeriode,
                    items: pelatihanController.tahunPeriode.map((periode) {
                      return DropdownMenuItem<String>(
                        value: periode.idPeriode.toString(),
                        child: Text(periode.tahunPeriode),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTahunPeriode = value;
                      });
                    },
                  );
                }),

                Obx(() {
                  if (pelatihanController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (pelatihanController.jenisPelatihanList.isEmpty) {
                    return const Text('Jenis Bidang tidak tersedia');
                  }
                  return DropdownField(
                    label: 'Jenis Bidang',
                    value: selectedJenisBidang,
                    items: pelatihanController.jenisPelatihanList.map((jenis) {
                      return DropdownMenuItem<String>(
                        value: jenis.idJenisPelatihan.toString(),
                        child: Text(jenis.namaJenisPelatihan),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedJenisBidang = value;
                      });
                    },
                  );
                }),

                // Input lainnya
                InputField(
                  label: 'Nama Pelatihan',
                  controller: namaPelatihanController,
                  validator: (value) =>
                      value!.isEmpty ? 'Nama Pelatihan wajib diisi' : null,
                ),
                InputField(
                  label: 'No Pelatihan',
                  controller: noPelatihanController,
                  validator: (value) =>
                      value!.isEmpty ? 'No Pelatihan wajib diisi' : null,
                ),
                InputField(
                  label: 'Biaya Pelatihan',
                  controller: biayaController,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Biaya Pelatihan wajib diisi' : null,
                ),
                InputField(
                  label: 'Kuota',
                  controller: kuotaController,
                  isReadOnly: true,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Kuota wajib diisi' : null,
                ),
                InputField(
                  label: 'Masa Berlaku',
                  controller: masaBerlaku,
                  isReadOnly: true,
                  onTap: () {
                    _selectDate(context, masaBerlaku);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Masa Berlaku wajib diisi' : null,
                ),
                InputField(
                  label: 'Tanggal Pelatihan',
                  controller: tanggal,
                  isReadOnly: true,
                  onTap: () {
                    _selectDate(context, tanggal);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Tanggal Pelatihan wajib diisi' : null,
                ),
                // Row(
                //   children: [
                //     ElevatedButton(
                //       onPressed: () async {
                //         FilePickerResult? result = await FilePicker.platform
                //             .pickFiles(
                //                 type: FileType.custom,
                //                 allowedExtensions: ['pdf']);

                //         if (result != null) {
                //           setState(() {
                //             file = File(result.files.single.path!);
                //           });
                //           print(file);
                //         } else {
                //           // User canceled the picker
                //         }
                //       },
                //       child: Text(
                //           'Pilih File Bukti Pelatihan ${file?.path.split('/').last ?? 'Belum ada file'}'),
                //     ),
                //   ],
                // ),

                // MultiSelectDialogField(
                //     buttonText: const Text('Bidang Minat'),
                //     title: const Text('Bidang Minat'),
                //     items: pelatihanController.bidangMinatList
                //         .map((bidangMinat) => MultiSelectItem<String>(
                //             bidangMinat.idBidangMinat.toString(),
                //             bidangMinat.namaBidangMinat))
                //         .toList(),
                //     onConfirm: (val) {
                //       selectedBidangMinat = val;
                //     }),

                //bidang minat
                MultiSelectField(label: 'Bidang Minat', 
                buttonText: 'Bidang Minat', 
                items: pelatihanController.bidangMinatList
                        .map((bidangMinat) => MultiSelectItem<String>(
                            bidangMinat.idBidangMinat.toString(),
                            bidangMinat.namaBidangMinat))
                        .toList(), 
                onConfirm: (val) {
                      selectedBidangMinat = val;
                    }),


                MultiSelectField(label: 'Mata Kuliah', 
                buttonText: 'Mata Kuliah', 
                items: pelatihanController.mataKuliahList
                        .map((mataKuliah) => MultiSelectItem<String>(
                            mataKuliah.idMatakuliah.toString(),
                            mataKuliah.namaMatakuliah))
                        .toList(), 
                  onConfirm: (val) {
                      selectedMataKuliah = val;}),

                      const SizedBox(height: 20),
                // MultiSelectDialogField(
                //     buttonText: const Text('Mata Kuliah'),
                //     title: const Text('Mata Kuliah'),
                //     items: pelatihanController.mataKuliahList
                //         .map((mataKuliah) => MultiSelectItem<String>(
                //             mataKuliah.idMatakuliah.toString(),
                //             mataKuliah.namaMatakuliah))
                //         .toList(),
                //     onConfirm: (val) {
                //       selectedMataKuliah = val;
                //     }),

                // Tombol Tambah Pelatihan
                // ElevatedButton(
                //   onPressed: () => _createBukti(),
                //   child: const Text('Tambah Pelatihan'),
                // ),

                               //upload file bukti
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Label untuk file
                  Expanded(
                    flex: 2,
                    child: Text(
                      'File yang dipilih:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 55, 94, 151),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  // Tampilan nama file
                  Expanded(
                    flex: 3,
                    child: Text(
                      file?.path.split('/').last ?? 'Belum ada file',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ),
                  
                  // Tombol Pilih File
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );

                        if (result != null) {
                          setState(() {
                            file = File(result.files.single.path!);
                          });
                          print(file);
                        } else {
                          // User canceled the picker
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Tidak ada file yang dipilih.'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        backgroundColor: Color.fromARGB(255, 55, 94, 151),
                      ),
                      child: const Text(
                        'Pilih File',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 23),

              // Tombol Tambah Sertifikasi
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                SizedBox(
                width: 80,
                child: OutlinedButton(
                  onPressed: () {
                    // Mengembalikan ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 239, 84, 40),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 84, 40),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

               const SizedBox(width: 20), 
                 SizedBox(
                  width: 80, // Mengatur lebar yang sama untuk tombol Save
                  child: ElevatedButton(
                    onPressed: () => _createBukti(), 
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator; // Tambahkan ini

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.isReadOnly = false,
    this.onTap,
    this.validator, // Tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 94, 151),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          readOnly: isReadOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          validator: validator, // Pastikan ini digunakan
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? value;

  const DropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 94, 151),
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
          ),
        ),
      ],
    );
  }
}


class MultiSelectField extends StatelessWidget {
  final String label;
  final String buttonText;
  final List<MultiSelectItem<String>> items;
  final Function(List<String>) onConfirm;
  final List<String> initialValues;
  final double? fieldWidth; // Menambahkan properti lebar field
  final double? fieldHeight;

  const MultiSelectField({
    super.key,
    required this.label,
    required this.buttonText,
    required this.items,
    required this.onConfirm,
    this.fieldWidth, // Lebar field input
    this.fieldHeight = 48.0,
    this.initialValues = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 94, 151),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 55, 94, 151),),
            borderRadius: BorderRadius.circular(10),
          ),
          width: fieldWidth ?? double.infinity, // Atur lebar dropdown
          height: fieldHeight,
          child: MultiSelectDialogField(
            buttonText: Text(
              buttonText,
              style: const TextStyle(color: Colors.grey),
            ),
            title: Text(label),
            items: items,
            initialValue: initialValues,
            onConfirm: onConfirm,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
