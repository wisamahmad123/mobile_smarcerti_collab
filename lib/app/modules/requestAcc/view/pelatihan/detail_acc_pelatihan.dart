import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/controller/req_acc_controller.dart';

class DetailAccPelatihan extends StatelessWidget {
  final Pelatihan pelatihanDetail;
  final ReqAccController controller = Get.put(ReqAccController());

  DetailAccPelatihan({
    super.key,
    required this.pelatihanDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Pelatihan
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  pelatihanDetail.namaPelatihan,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF375E97),
                  ),
                ),
              ),
              // Info singkat
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "${pelatihanDetail.tanggal.toLocal().toString().substring(0, 10)} | ${pelatihanDetail.lokasi}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              // Detail Pelatihan
              buildDetailItem(
                  "Level Pelatihan:", pelatihanDetail.levelPelatihan),
              buildDetailItem("Kuota Peserta:", pelatihanDetail.kuotaPeserta),
              buildDetailItem("Biaya:", pelatihanDetail.biaya),
              buildDetailItem("Vendor:", pelatihanDetail.vendorPelatihan.nama),
              buildDetailItem(
                  "Bidang Minat:",
                  pelatihanDetail.bidangMinatPelatihan.isEmpty
                      ? "Tidak ada"
                      : pelatihanDetail.bidangMinatPelatihan
                          .map((e) => e.namaBidangMinat)
                          .join(", ")),
              buildDetailItem(
                  "Mata Kuliah:",
                  pelatihanDetail.mataKuliahPelatihan.isEmpty
                      ? "Tidak ada"
                      : pelatihanDetail.mataKuliahPelatihan
                          .map((e) => e.namaMatakuliah)
                          .join(", ")),
              buildDetailItem("Status Pengajuan:", pelatihanDetail.status),

              // Tabel Dosen dan Peserta
              buildPesertaTable(context),

              // Tombol Terima dan Tolak
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      accDialog(context, "Terima");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Terima",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol Tolak
                      accDialog(context, "Tolak");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Tolak",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan detail item secara dinamis
  Widget buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "$label $value",
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          color: Color(0xFF375E97),
        ),
      ),
    );
  }

  // Widget untuk tabel dosen dan peserta
  Widget buildPesertaTable(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
            },
            border: TableBorder.all(color: Colors.grey.shade300),
            children: [
              // Header Tabel
              const TableRow(
                children: [
                  Center(child: Text('No')),
                  Center(child: Text('Nama Peserta')),
                  Center(child: Text('Aksi')),
                ],
              ),
              // Data Peserta
              ...pelatihanDetail.detailPesertaPelatihan.asMap().entries.map(
                (entry) {
                  final index = entry.key + 1; // No urut peserta
                  final peserta = entry.value; // Data peserta
                  return TableRow(
                    children: [
                      Center(
                        child: Text(
                          '$index',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(child: Text(peserta.namaLengkap)),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Aksi ketika tombol "Detail" ditekan
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(peserta.namaLengkap),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Email : ${peserta.email}"),
                                        const SizedBox(
                                            height: 8), // Jarak antar teks
                                        Text(
                                            "Jenis Kelamin : ${peserta.jenisKelamin}"),
                                        const SizedBox(
                                            height: 8), // Jarak antar teks
                                        Text(
                                            "Nomor Telepon : ${peserta.noTelp}"),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Detail',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> accDialog(BuildContext context, String action) {
    String status;
    // Cek apakah tombolnya "Terima" atau "Tolak"
    String message = (action == "Terima")
        ? "Apakah Anda yakin ingin menerima pengajuan?"
        : "Apakah Anda yakin ingin menolak pengajuan?";

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 270,
            height: 170,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 84, 40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 239, 84, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Tidak",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 100,
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
                            "Ya",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 239, 84, 40),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            // Fungsi untuk mengupdate status
                            if (action == "Terima") {
                              status = "terima";
                            } else {
                              status = "tolak";
                            }

                            String id = pelatihanDetail.idPelatihan;
                            controller.updateStatusPelatihan(status,
                                id); // Memanggil fungsi updateStatusPelatihan

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
