import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/detail_sertifikasi_page.dart';

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
        lastDate: DateTime(2100),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          controller.text = picked.toString().split(' ')[0];
        });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  //Nomor sertifikat
                  InputField(
                    label: 'No Sertifikasi',
                    controller: noSertifikasiController,
                    validator: (value) => value!.isEmpty ? 'No Sertifikasi wajib diisi' : null,
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

                 
                  /*ow(
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
                  */

                  const SizedBox(height: 20),
                  

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
                    onPressed: () => _updateBukti(), 
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

