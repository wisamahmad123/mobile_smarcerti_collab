import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/detail_pelatihan_page.dart';

class ListAddBukti extends StatefulWidget {
  final int idPelatihan;

  const ListAddBukti({Key? key, required this.idPelatihan}) : super(key: key);

  @override
  _ListAddBuktiState createState() => _ListAddBuktiState();
}

class _ListAddBuktiState extends State<ListAddBukti> {
  final PelatihanController controller = Get.put(PelatihanController());

  final TextEditingController masaBerlaku = TextEditingController();
  final TextEditingController tanggal = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? file;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadPelatihanById(widget.idPelatihan);
    });
  }

  Future _updateBukti() async {
    final pelatihan = controller.pelatihanDetail.value;

    Map<String, dynamic> formData = {
      'id_vendor_pelatihan': pelatihan!.idVendorPelatihan,
      'id_jenis_pelatihan': pelatihan.idJenisPelatihan,
      'id_periode': pelatihan.idPeriode,
      'id_bidang_minat': pelatihan.bidangMinatPelatihan.first.idBidangMinat,
      'id_matakuliah': pelatihan.mataKuliahPelatihan.first.idMatakuliah,
      'user_id': pelatihan.detailPesertaPelatihan.first.userId,
      'nama_pelatihan': pelatihan.namaPelatihan,
      'jenis': pelatihan.jenisPelatihan,
      'bukti_pelatihan': file!.path,
      'biaya': pelatihan.biaya,
      'kuota_peserta': pelatihan.kuotaPeserta,
    };
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 84, 40), // Warna latar belakang
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Berhasil mengubah data",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color:
                                Color.fromARGB(255, 239, 84, 40), // Warna teks
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                        Navigator.of(context).pop(); // Tutup dialog
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => DetailPelatihanPage(idPelatihan: pelatihan.idPelatihan),// Ganti dengan halaman detail pelatihan Anda
                        ));
                      },
                        /*onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },*/
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
     );

    controller.updatePelatihan(widget.idPelatihan, formData);

   
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


                  const SizedBox(height: 20),
                  

                // Tombol Tambah pelatihan
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


