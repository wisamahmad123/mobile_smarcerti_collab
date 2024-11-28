import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';

class DetailAccPelatihan extends StatelessWidget {
  final Pelatihan pelatihanDetail;
  DetailAccPelatihan({
    super.key,
    required this.pelatihanDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(5),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF375E97),
                  ),
                ),
              ),
              // Detail Pelatihan
              buildDetailItem("Level Pelatihan:", pelatihanDetail.levelPelatihan),
              buildDetailItem("Kuota:", pelatihanDetail.kuotaPeserta),
              buildDetailItem("Tanggal:", pelatihanDetail.tanggal.toLocal().toString()),
              buildDetailItem("Lokasi:", pelatihanDetail.lokasi),
              buildDetailItem("Biaya:", pelatihanDetail.biaya),
              buildDetailItem("Vendor:", pelatihanDetail.vendorPelatihan.nama),
              buildDetailItem("Bidang Minat:", pelatihanDetail.bidangMinatPelatihan.isEmpty
                  ? "Tidak ada"
                  : pelatihanDetail.bidangMinatPelatihan.map((e) => e.namaBidangMinat).join(", ")),
              buildDetailItem("Mata Kuliah:", pelatihanDetail.mataKuliahPelatihan.isEmpty
                  ? "Tidak ada"
                  : pelatihanDetail.mataKuliahPelatihan.map((e) => e.namaMatakuliah).join(", ")),

              // Tabel Dosen dan Peserta
              buildPesertaTable(context),

              // Tombol Terima dan Tolak
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol Terima
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Terima"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol Tolak
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Tolak"),
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
          fontSize: 14,
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
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(8),
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
              TableRow(
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
                      Center(child: Text('$index')),
                      Center(child: Text(peserta.namaLengkap)),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Aksi ketika tombol "Detail" ditekan
                            // _showPesertaDetail(context, peserta);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Detail',
                              style: TextStyle(color: Colors.blue),
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
}
