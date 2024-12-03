// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/views/add_pelatihan_page.dart';

// class AddPelatihan extends StatelessWidget {
//   const AddPelatihan({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const DropdownField(label: 'Nama Vendor', options: ['Vendor 1', 'Vendor 2']),
//             const SizedBox(height: 20),
//             const DropdownField(label: 'Jenis Pelatihan', options: ['Jenis 1', 'Jenis 2']),
//             const SizedBox(height: 20),
//             const DropdownField(label: 'Tahun Periode', options: ['2023', '2024']),
//             const SizedBox(height: 20),
//             const InputField(label: 'Nama Pelatihan'),
//             const SizedBox(height: 20),
//             const InputField(label: 'Lokasi'),
//             const SizedBox(height: 20),
//             const DropdownField(label: 'Level Pelatihan', options: ['Nasional', 'Internasional']),
//             const SizedBox(height: 20),
//             const InputField(label: 'Tanggal', isDate: true),
//             const SizedBox(height: 20),
//             const FilePickerField(label: 'Bukti Pelatihan'),
//             const SizedBox(height: 20),
//             const InputField(label: 'Kuota Peserta'),
//             const SizedBox(height: 20),
//             const InputField(label: 'Biaya'),
//             const SizedBox(height: 20),
//             const MultiSelectDropdownField(label: 'Bidang Minat', options: ['Minat 1', 'Minat 2']),
//             const SizedBox(height: 20),
//             const MultiSelectDropdownField(label: 'Mata Kuliah', options: ['Matkul 1', 'Matkul 2']),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 120,
//                   child: OutlinedButton(
//                     onPressed: () {
//                       print("Cancel button clicked");
//                     },
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       side: const BorderSide(
//                         color: Color.fromARGB(255, 239, 84, 40),
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       'Cancel',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 239, 84, 40),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                   width: 120,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print("Save button clicked");
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       backgroundColor: const Color.fromARGB(255, 239, 84, 40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       'Save',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InputField extends StatelessWidget {
//   final String label;
//   final bool isDate;

//   const InputField({super.key, required this.label, this.isDate = false});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 55, 94, 151),
//           ),
//         ),
//         const SizedBox(height: 5),
//         TextFormField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//             suffixIcon: isDate ? const Icon(Icons.calendar_today) : null,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DropdownField extends StatelessWidget {
//   final String label;
//   final List<String> options;

//   const DropdownField({super.key, required this.label, required this.options});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 55, 94, 151),
//           ),
//         ),
//         const SizedBox(height: 5),
//         DropdownButtonFormField<String>(
//           items: options.map((option) {
//             return DropdownMenuItem(value: option, child: Text(option));
//           }).toList(),
//           onChanged: (value) {},
//           dropdownColor: Colors.white,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MultiSelectDropdownField extends StatelessWidget {
//   final String label;
//   final List<String> options;

//   const MultiSelectDropdownField({super.key, required this.label, required this.options});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 55, 94, 151),
//           ),
//         ),
//         const SizedBox(height: 5),
//         DropdownButtonFormField<List<String>>(
//           items: options.map((option) {
//             return DropdownMenuItem(value: [option], child: Text(option));
//           }).toList(),
//           onChanged: (value) {},
//           isExpanded: true,
//           dropdownColor: Colors.white,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FilePickerField extends StatelessWidget {
//   final String label;

//   const FilePickerField({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 55, 94, 151),
//           ),
//         ),
//         const SizedBox(height: 5),
//         Row(
//           children: [
//             Expanded(
//               flex: 5,
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                   ),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                   child: Text(
//                     'No file selected',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: ElevatedButton(
//                 onPressed: () {
//                   print("Choose File button clicked");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   backgroundColor: const Color.fromARGB(255, 55, 94, 151),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   'Choose File',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';

// class AddPelatihan extends StatelessWidget {
//   AddPelatihan({super.key});

//   final PelatihanController controller = Get.put(PelatihanController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final Map<String, dynamic> _formData = {}; // Menyimpan data input form

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               DropdownField(
//                 label: 'Nama Vendor',
//                 options: ['Vendor 1', 'Vendor 2'],
//                 onSaved: (value) => _formData['id_vendor_pelatihan'] = value,
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Jenis Pelatihan',
//                 options: ['Jenis 1', 'Jenis 2'],
//                 onSaved: (value) => _formData['id_jenis_pelatihan'] = value,
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Tahun Periode',
//                 options: ['2023', '2024'],
//                 onSaved: (value) => _formData['id_periode'] = value,
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Nama Pelatihan',
//                 onSaved: (value) => _formData['nama_pelatihan'] = value,
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Lokasi',
//                 onSaved: (value) => _formData['lokasi'] = value,
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Level Pelatihan',
//                 options: ['Nasional', 'Internasional'],
//                 onSaved: (value) => _formData['level_pelatihan'] = value,
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Tanggal',
//                 isDate: true,
//                 onSaved: (value) => _formData['tanggal'] = value,
//               ),
//               const SizedBox(height: 20),
//               FilePickerField(
//                 label: 'Bukti Pelatihan',
//                 onSaved: (filePath) => _formData['bukti_pelatihan'] = filePath,
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Kuota Peserta',
//                 onSaved: (value) => _formData['kuota_peserta'] = value,
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Biaya',
//                 onSaved: (value) => _formData['biaya'] = value,
//               ),
//               const SizedBox(height: 20),
//               MultiSelectDropdownField(
//                 label: 'Bidang Minat',
//                 options: ['Minat 1', 'Minat 2'],
//                 onSaved: (values) => _formData['id_bidang_minat'] = values,
//               ),
//               const SizedBox(height: 20),
//               MultiSelectDropdownField(
//                 label: 'Mata Kuliah',
//                 options: ['Matkul 1', 'Matkul 2'],
//                 onSaved: (values) => _formData['id_matakuliah'] = values,
//               ),
//               const SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Get.back(); // Kembali ke halaman sebelumnya
//                       },
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         side: const BorderSide(
//                           color: Color.fromARGB(255, 239, 84, 40),
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 239, 84, 40),
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   SizedBox(
//                     width: 120,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save(); // Simpan semua input
//                           controller.addPelatihan(_formData); // Panggil fungsi tambah pelatihan
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         backgroundColor: const Color.fromARGB(255, 239, 84, 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Save',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';

// class AddPelatihan extends StatelessWidget {
//   AddPelatihan({super.key});

//   final PelatihanController controller = Get.put(PelatihanController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final Map<String, dynamic> _formData = {}; // Menyimpan data input form

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tambah Pelatihan'),
//         backgroundColor: const Color.fromARGB(255, 239, 84, 40),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               DropdownField(
//                 label: 'Nama Vendor',
//                 options: ['Vendor 1', 'Vendor 2'],
//                 onSaved: (value) => _formData['id_vendor_pelatihan'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vendor harus dipilih';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Jenis Pelatihan',
//                 options: ['Jenis 1', 'Jenis 2'],
//                 onSaved: (value) => _formData['id_jenis_pelatihan'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Jenis pelatihan harus dipilih';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Tahun Periode',
//                 options: ['2023', '2024'],
//                 onSaved: (value) => _formData['id_periode'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Tahun periode harus dipilih';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Nama Pelatihan',
//                 onSaved: (value) => _formData['nama_pelatihan'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Nama pelatihan harus diisi';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Lokasi',
//                 onSaved: (value) => _formData['lokasi'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Lokasi harus diisi';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               DropdownField(
//                 label: 'Level Pelatihan',
//                 options: ['Nasional', 'Internasional'],
//                 onSaved: (value) => _formData['level_pelatihan'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Level pelatihan harus dipilih';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Tanggal',
//                 isDate: true,
//                 onSaved: (value) => _formData['tanggal'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Tanggal harus diisi';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Kuota Peserta',
//                 onSaved: (value) => _formData['kuota_peserta'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Kuota peserta harus diisi';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               InputField(
//                 label: 'Biaya',
//                 onSaved: (value) => _formData['biaya'] = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Biaya harus diisi';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               MultiSelectDropdownField(
//                 label: 'Bidang Minat',
//                 options: ['Minat 1', 'Minat 2'],
//                 onSaved: (values) => _formData['id_bidang_minat'] = values,
//               ),
//               const SizedBox(height: 20),
//               MultiSelectDropdownField(
//                 label: 'Mata Kuliah',
//                 options: ['Matkul 1', 'Matkul 2'],
//                 onSaved: (values) => _formData['id_matakuliah'] = values,
//               ),
//               const SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Get.back(); // Kembali ke halaman sebelumnya
//                       },
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         side: const BorderSide(
//                           color: Color.fromARGB(255, 239, 84, 40),
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 239, 84, 40),
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   SizedBox(
//                     width: 120,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save(); // Simpan semua input
//                           controller.addPelatihan(_formData); // Panggil fungsi tambah pelatihan
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         backgroundColor: const Color.fromARGB(255, 239, 84, 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Save',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';

class AddPelatihan extends StatelessWidget {
  AddPelatihan({super.key});

  final PelatihanController controller = Get.put(PelatihanController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownField(
                label: 'Nama Vendor',
                options: ['Vendor 1', 'Vendor 2'],
                onSaved: (value) => _formData['id_vendor_pelatihan'] = value,
              ),
              const SizedBox(height: 20),
              DropdownField(
                label: 'Jenis Pelatihan',
                options: ['Jenis 1', 'Jenis 2'],
                onSaved: (value) => _formData['id_jenis_pelatihan'] = value,
              ),
              const SizedBox(height: 20),
              DropdownField(
                label: 'Tahun Periode',
                options: ['2023', '2024'],
                onSaved: (value) => _formData['id_periode'] = value,
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'Nama Pelatihan',
                onSaved: (value) => _formData['nama_pelatihan'] = value,
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'Lokasi',
                onSaved: (value) => _formData['lokasi'] = value,
              ),
              const SizedBox(height: 20),
              DropdownField(
                label: 'Level Pelatihan',
                options: ['Nasional', 'Internasional'],
                onSaved: (value) => _formData['level_pelatihan'] = value,
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'Tanggal',
                isDate: true,
                onSaved: (value) => _formData['tanggal'] = value,
              ),
              const SizedBox(height: 20),
              FilePickerField(
                label: 'Bukti Pelatihan',
                onSaved: (filePath) => _formData['bukti_pelatihan'] = filePath,
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'Kuota Peserta',
                onSaved: (value) => _formData['kuota_peserta'] = value,
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'Biaya',
                onSaved: (value) => _formData['biaya'] = value,
              ),
              const SizedBox(height: 20),
              MultiSelectDropdownField(
                label: 'Bidang Minat',
                options: ['Minat 1', 'Minat 2'],
                onSaved: (values) => _formData['id_bidang_minat'] = values,
              ),
              const SizedBox(height: 20),
              MultiSelectDropdownField(
                label: 'Mata Kuliah',
                options: ['Matkul 1', 'Matkul 2'],
                onSaved: (values) => _formData['id_matakuliah'] = values,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          controller.addPelatihan(_formData);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
    );
  }
}

// Widget DropdownField
class DropdownField extends StatelessWidget {
  final String label;
  final List<String> options;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String>? validator;

  const DropdownField({
    required this.label,
    required this.options,
    required this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: options
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (_) {},
          onSaved: onSaved,
          validator: validator,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

// Widget InputField
class InputField extends StatelessWidget {
  final String label;
  final bool isDate;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String>? validator;

  const InputField({
    required this.label,
    required this.onSaved,
    this.isDate = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          readOnly: isDate,
          onTap: isDate
              ? () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    onSaved(
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}");
                  }
                }
              : null,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}

// Widget FilePickerField
class FilePickerField extends StatelessWidget {
  final String label;
  final FormFieldSetter<String> onSaved;

  const FilePickerField({required this.label, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            if (result != null && result.files.single.path != null) {
              onSaved(result.files.single.path!);
            }
          },
          child: const Text('Pilih File'),
        ),
      ],
    );
  }
}

// Widget MultiSelectDropdownField
class MultiSelectDropdownField extends StatelessWidget {
  final String label;
  final List<String> options;
  final FormFieldSetter<List<String>> onSaved;

  const MultiSelectDropdownField({
    required this.label,
    required this.options,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        MultiSelectDialogField(
          items: options.map((e) => MultiSelectItem(e, e)).toList(),
          onConfirm: (values) => onSaved(values),
          decoration: const BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      ],
    );
  }
}
