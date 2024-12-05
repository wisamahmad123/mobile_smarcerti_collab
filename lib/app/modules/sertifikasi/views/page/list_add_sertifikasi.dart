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
      sertifikasiController.loadVendors();
      sertifikasiController.loadBidangMinat();
      sertifikasiController.loadMataKuliah();
      sertifikasiController.loadJenisSertifikasi();
      sertifikasiController.loadPeriode();
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
                //Nama sertifikasi
                 InputField(
                  label: 'Nama Sertifikasi',
                  controller: namaSertifikasiController,
                  validator: (value) => value!.isEmpty ? 'Nama Sertifikasi wajib diisi' : null,
                ),

                //Nomor sertifikat
                InputField(
                  label: 'No Sertifikasi',
                  controller: noSertifikasiController,
                  validator: (value) => value!.isEmpty ? 'No Sertifikasi wajib diisi' : null,
                ),

                // Vendor Dropdown
               Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.vendorList.isEmpty) {
                    return const Text('Vendor tidak tersedia');
                  }
                  return DropdownField(
                    label: 'Nama Vendor',
                    // Menggunakan item dari vendorList dan mengupdate selectedVendor
                    // Anda tetap menggunakan logic yang sama untuk mendapatkan data
                    onChanged: (value) {
                      selectedVendor = value;  // Mengupdate selectedVendor berdasarkan pilihan pengguna
                    },
                    value: selectedVendor,
                    items: sertifikasiController.vendorList.map((vendor) {
                      return DropdownMenuItem<String>(
                        value: vendor.idVendorSertifikasi.toString(), // Id yang digunakan untuk pilihan
                        child: Text(vendor.nama),
                      );
                    }).toList(),
                    validator: (value) => value == null ? 'Vendor harus dipilih' : null,
                  );
                }),

                 //jenis sertifikasi
                DropdownField(
                  label: 'Jenis Sertifikasi',
                  value: selectedJenis,
                  items: jenisSertifikasi.map((jenis) {
                    return DropdownMenuItem<String>(
                      value: jenis,
                      child: Text(jenis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedJenis = value;
                  },
                  validator: (value) =>
                      value == null ? 'Jenis Sertifikasi harus dipilih' : null,
                ),


                // Jenis Bidang
                Obx(() {
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.jenisSertifikasiList.isEmpty) {
                    return const Text('Jenis Bidang');
                  }
                  return DropdownField(
                    label: 'Jenis Bidang',
                    value: selectedJenisBidang,
                    items: sertifikasiController.jenisSertifikasiList.map((jenis) {
                      return DropdownMenuItem<String>(
                        value: jenis.idJenisSertifikasi.toString(),
                        child: Text(jenis.namaJenisSertifikasi),
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
                  if (sertifikasiController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (sertifikasiController.tahunPeriode.isEmpty) {
                    return const Text('Tahun Periode');
                  }
                  return DropdownField(
                    label: 'Tahun Periode',
                    value: selectedTahunPeriode,
                    items: sertifikasiController.tahunPeriode.map((periode) {
                      return DropdownMenuItem<String>(
                        value: periode.idPeriode.toString(),
                        child: Text(periode.tahunPeriode),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedTahunPeriode = value;
                    },
                    validator: (value) => value == null
                        ? 'Tahun Periode hars dipilih '
                        : null,
                  );
                }),

                //tanggal sertifikasi
                 InputField(
                  label: 'Tanggal Sertifikasi',
                  controller: tanggal,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context, tanggal);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Tanggal Sertifikasi wajib diisi' : null,
                ),

                //masa berlaku
                InputField(
                  label: 'Masa Berlaku',
                  controller: masaBerlaku,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context, masaBerlaku);
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Masa Berlaku wajib diisi' : null,
                ),

                //kuota
                InputField(
                  label: 'Kuota',
                  controller: kuotaController,
                  readOnly: true,
                  validator: (value) => value!.isEmpty ? 'Kuota wajib diisi' : null,
                  ),
                 

                //biaya sertifikasi
                InputField(
                  label: 'Biaya Sertifikasi',
                  controller: biayaController,
                  validator: (value) => value!.isEmpty ? 'Biaya Sertifikasi wajib diisi' : null,
                ),

                
                //bidang minat
                MultiSelectField(label: 'Bidang Minat', 
                buttonText: 'Bidang Minat', 
                items: sertifikasiController.bidangMinatList
                        .map((bidangMinat) => MultiSelectItem<String>(
                            bidangMinat.idBidangMinat.toString(),
                            bidangMinat.namaBidangMinat))
                        .toList(), 
                onConfirm: (val) {
                      selectedBidangMinat = val;
                    }),

                 /*MultiSelectDialogField(
                    buttonText: const Text('Bidang Minat'),
                    title: const Text('Bidang Minat'),
                    items: sertifikasiController.bidangMinatList
                        .map((bidangMinat) => MultiSelectItem<String>(
                            bidangMinat.idBidangMinat.toString(),
                            bidangMinat.namaBidangMinat))
                        .toList(),
                    onConfirm: (val) {
                      selectedBidangMinat = val;
                    }),*/

                //mata kuliah
                MultiSelectField(label: 'Mata Kuliah', 
                buttonText: 'Mata Kuliah', 
                items: sertifikasiController.mataKuliahList
                        .map((mataKuliah) => MultiSelectItem<String>(
                            mataKuliah.idMatakuliah.toString(),
                            mataKuliah.namaMatakuliah))
                        .toList(), 
                  onConfirm: (val) {
                      selectedMataKuliah = val;}),

                 /*MultiSelectDialogField(
                    buttonText: const Text('Mata Kuliah'),
                    title: const Text('Mata Kuliah'),
                    items: sertifikasiController.mataKuliahList
                        .map((mataKuliah) => MultiSelectItem<String>(
                            mataKuliah.idMatakuliah.toString(),
                            mataKuliah.namaMatakuliah))
                        .toList(),
                    onConfirm: (val) {
                      selectedMataKuliah = val;
                    }),*/

                //upload file bukti
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
    this.fieldHeight = 48.0, // Tinggi default field input
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 55, 94, 151)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 30, 144, 255)),
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
    this.fieldHeight = 48.0, // Tinggi default field input
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 55, 94, 151)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 30, 144, 255)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                fillColor: Colors.white, // Background putih untuk dropdown
                filled: true,
              ),
              items: items,
              onChanged: onChanged,
              validator: validator,
              dropdownColor: Colors.white, // Background putih untuk pilihan dropdown
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

