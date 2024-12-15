import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/pelatihan_page.dart';
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
  final TextEditingController lokasiPelatihanController =
      TextEditingController(); //lokasi
  final TextEditingController biayaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController buktiPelatihanController =
      TextEditingController();
  final TextEditingController kuotaController =
      TextEditingController(text: '1');

  File? file;
  String? selectedVendor;
  String? selectedJenisBidang;
  // String? selectedJenis;
  String? selectedLevelPelatihan;
  String? selectedTahunPeriode;
  List<String> selectedBidangMinat = [];
  List<String> selectedMataKuliah = [];

  final TextEditingController tanggal = TextEditingController();
  DateTime selectedDate = DateTime.now();

  static const List<String> levelPelatihan = [
    'Internasional',
    'Nasional',
  ];

  Future _createBukti() async {
    MyAccountController myAccountController = Get.put(MyAccountController());

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = {
        // 'id_vendor_pelatihan': int.tryParse(selectedVendor ?? '0'), // Konversi ke int
        // 'id_jenis_pelatihan': int.tryParse(selectedJenisBidang ?? '0'), // Konversi ke int
        // 'id_periode': int.tryParse(selectedTahunPeriode ?? '0'), // Konversi ke int
        // 'id_bidang_minat': selectedBidangMinat.map((e) => int.tryParse(e) ?? 0).toList(), // Konversi ke int untuk list
        // 'id_matakuliah': selectedMataKuliah.map((e) => int.tryParse(e) ?? 0).toList(), // Konversi ke int untuk list

        'id_vendor_pelatihan': selectedVendor,
        'id_jenis_pelatihan': selectedJenisBidang,
        'id_periode': selectedTahunPeriode,
        'id_bidang_minat': selectedBidangMinat,
        'id_matakuliah': selectedMataKuliah,
        'user_id': myAccountController.myAccounts.first.id,
        'nama_pelatihan': namaPelatihanController.text,
        'lokasi': lokasiPelatihanController.text, //lokasi
        // 'jenis': selectedJenis,
        'level_pelatihan': selectedLevelPelatihan,
        'tanggal': tanggal.text,
        'bukti_pelatihan': file!.path,
        'biaya': biayaController.text,
        'kuota_peserta': kuotaController.text,
      };

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return Dialog(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: Container(
      //         padding: const EdgeInsets.all(20),
      //         decoration: const BoxDecoration(
      //           color: Color.fromARGB(255, 239, 84, 40), // Warna latar belakang
      //           borderRadius: BorderRadius.all(Radius.circular(10)),
      //         ),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             const Text(
      //               "Berhasil menambahkan data Pelatihan",
      //               style: TextStyle(
      //                 fontFamily: 'Poppins',
      //                 color: Colors.white,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //               textAlign: TextAlign.center,
      //             ),
      //             const SizedBox(height: 20),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 SizedBox(
      //                   width: 80,
      //                   height: 40,
      //                   child: ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                       backgroundColor: Colors.white,
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(8),
      //                         side: const BorderSide(
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                     child: const Text(
      //                       "OK",
      //                       style: TextStyle(
      //                         fontFamily: 'Poppins',
      //                         color: Color.fromARGB(
      //                             255, 239, 84, 40), // Warna teks
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                     onPressed: () {
      //                       Navigator.of(context).pop(); // Tutup dialog
      //                       Navigator.of(context)
      //                           .pushReplacement(MaterialPageRoute(
      //                         builder: (context) =>
      //                             PelatihanPage(), // Ganti dengan halaman detail sertifikasi Anda
      //                       ));
      //                     },
      //                     /*onPressed: () {
      //                     Navigator.of(context).pop(); // Tutup dialog
      //                   },*/
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );

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
        lastDate: DateTime(2100),
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
                //Nama Pelatihan
                InputField(
                  label: 'Nama Pelatihan',
                  controller: namaPelatihanController,
                  validator: (value) =>
                      value!.isEmpty ? 'Nama Pelatihan wajib diisi' : null,
                ),

                //Nomor sertifikat ganti lokasi
                InputField(
                  label: 'Lokasi Pelatihan',
                  controller: lokasiPelatihanController,
                  validator: (value) =>
                      value!.isEmpty ? 'No Pelatihan wajib diisi' : null,
                ),

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
                    // Menggunakan item dari vendorList dan mengupdate selectedVendor
                    // Anda tetap menggunakan logic yang sama untuk mendapatkan data
                    onChanged: (value) {
                      selectedVendor =
                          value; // Mengupdate selectedVendor berdasarkan pilihan pengguna
                    },
                    value: selectedVendor,
                    items: pelatihanController.vendorList.map((vendor) {
                      return DropdownMenuItem<String>(
                        value: vendor.idVendorPelatihan
                            .toString(), // Id yang digunakan untuk pilihan
                        child: Text(vendor.nama),
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? 'Vendor harus dipilih' : null,
                  );
                }),

                //jenis Pelatihan profesi
                DropdownField(
                  label: 'Level Pelatihan',
                  value: selectedLevelPelatihan,
                  items: levelPelatihan.map((level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedLevelPelatihan = value;
                  },
                  validator: (value) =>
                      value == null ? 'Jenis Pelatihan harus dipilih' : null,
                ),

                // Jenis Bidang
                Obx(() {
                  if (pelatihanController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (pelatihanController.jenisPelatihanList.isEmpty) {
                    return const Text('Jenis Bidang');
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
                      selectedJenisBidang = value;
                    },
                    validator: (value) =>
                        value == null ? 'Jenis Bidang harus dipilih' : null,
                  );
                }),

                // Tahun Periode
                Obx(() {
                  if (pelatihanController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (pelatihanController.tahunPeriode.isEmpty) {
                    return const Text('Tahun Periode');
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
                      selectedTahunPeriode = value;
                    },
                    validator: (value) =>
                        value == null ? 'Tahun Periode hars dipilih ' : null,
                  );
                }),

                //tanggal Pelatihan
                InputField(
                  label: 'Tanggal Pelatihan',
                  controller: tanggal,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context, tanggal);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Tanggal Pelatihan wajib diisi' : null,
                ),

                //kuota
                InputField(
                  label: 'Kuota',
                  controller: kuotaController,
                  readOnly: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Kuota wajib diisi' : null,
                ),

                //biaya Pelatihan
                InputField(
                  label: 'Biaya Pelatihan',
                  controller: biayaController,
                  validator: (value) =>
                      value!.isEmpty ? 'Biaya Pelatihan wajib diisi' : null,
                ),

                //bidang minat
                MultiSelectField(
                    label: 'Bidang Minat',
                    buttonText: 'Bidang Minat',
                    items: pelatihanController.bidangMinatList
                        .map((bidangMinat) => MultiSelectItem<String>(
                            bidangMinat.idBidangMinat.toString(),
                            bidangMinat.namaBidangMinat))
                        .toList(),
                    onConfirm: (val) {
                      selectedBidangMinat = val;
                    }),

                //mata kuliah
                MultiSelectField(
                    label: 'Mata Kuliah',
                    buttonText: 'Mata Kuliah',
                    items: pelatihanController.mataKuliahList
                        .map((mataKuliah) => MultiSelectItem<String>(
                            mataKuliah.idMatakuliah.toString(),
                            mataKuliah.namaMatakuliah))
                        .toList(),
                    onConfirm: (val) {
                      selectedMataKuliah = val;
                    }),

                const SizedBox(height: 20),

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
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

                // Tombol Tambah Pelatihan
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 239, 84, 40),
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
  final bool? readOnly;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final double? fieldWidth; // Menambahkan properti lebar field
  final double? fieldHeight; // Menambahkan properti tinggi field

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.isReadOnly = false,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.fieldWidth, // Lebar field input
    this.fieldHeight, // Tinggi default field input
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
        const SizedBox(height: 3),
        SizedBox(
          width: fieldWidth ?? double.infinity, // Atur lebar field
          height: fieldHeight, // Atur tinggi field
          child: TextFormField(
            controller: controller,
            readOnly: isReadOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            validator: validator, // Validasi field
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 55, 94, 151)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 30, 144, 255)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  final double? fieldWidth; // Menambahkan properti lebar field
  final double? fieldHeight; // Menambahkan properti tinggi field

  const DropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.fieldWidth, // Lebar field input
    this.fieldHeight, // Tinggi default field input
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background putih untuk widget ini
      child: Column(
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
          const SizedBox(height: 3), // Jarak antara label dan dropdown
          SizedBox(
            width: fieldWidth ?? double.infinity, // Atur lebar dropdown
            height: fieldHeight, // Atur tinggi dropdown
            child: DropdownButtonFormField<String>(
              value: value,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 55, 94, 151)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 30, 144, 255)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                fillColor: Colors.white, // Background putih untuk dropdown
                filled: true,
              ),
              items: items,
              onChanged: onChanged,
              validator: validator,
              dropdownColor:
                  Colors.white, // Background putih untuk pilihan dropdown
            ),
          ),
          const SizedBox(height: 8), // Jarak di bawah DropdownButtonFormField
        ],
      ),
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
    this.fieldHeight,
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
            border: Border.all(
              color: Color.fromARGB(255, 55, 94, 151),
            ),
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
