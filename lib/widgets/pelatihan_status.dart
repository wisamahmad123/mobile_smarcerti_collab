import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/detail_pelatihan_page.dart';
import 'package:mobile_smarcerti/pages/pengajuan_pelatihan_dosen.dart';
import 'package:mobile_smarcerti/pages/upload_pelatihan_page.dart';

class PelatihanStatus extends StatelessWidget {
  const PelatihanStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fillColor: const Color.fromARGB(145, 255, 249, 249),
              filled: true,
            ),
          ),
          const SizedBox(
              height:
                  20), // Spasi antara search bar dan tombol Pengajuan & Upload
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  // Aksi ketika tombol "Pengajuan" ditekan
                  print("Upcoming");
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(110, 40),
                  maximumSize: Size(110, 40),
                  backgroundColor: const Color.fromARGB(
                      100, 239, 84, 40), // Warna tombol biru
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Padding tombol
                ),
                child: const Text(
                  'Upcoming',
                  style: TextStyle(
                      color:
                          Color.fromARGB(255, 239, 84, 40)), // Warna teks putih
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // Aksi ketika tombol "Upload" ditekan
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(110, 40),
                  maximumSize: Size(110, 40),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Padding tombol
                ),
                child: const Text(
                  'Ongoing',
                  style: TextStyle(color: Colors.black), // Warna teks putih
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // Aksi ketika tombol "Upload" ditekan
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(110, 40),
                  maximumSize: Size(110, 40),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Padding tombol
                ),
                child: const Text(
                  'Past',
                  style: TextStyle(color: Colors.black), // Warna teks putih
                ),
              ),
            ],
          ),
          const SizedBox(
              height:
                  20), // Spasi antara search bar dan tombol Pengajuan & Upload
          // Button Pengajuan & Upload
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PengajuanPelatihanDosen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 55, 94, 151), // Warna tombol biru
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Padding tombol
                ),
                child: const Text(
                  'Pengajuan',
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
              ),
              const SizedBox(
                  width: 10), // Jarak antar tombol Pengajuan dan Upload

              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol "Upload" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadPelatihanPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 239, 84, 40), // Warna tombol oranye
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Padding tombol
                ),
                child: const Text(
                  'Upload',
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
              ),
            ],
          ),

          const SizedBox(height: 20), // Spasi antara tombol dan ListView

          // Expanded agar ListView bisa scroll
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: const TableBorder.symmetric(),
                    columnWidths: const {
                      0: FixedColumnWidth(40), // No
                      1: FlexColumnWidth(), // Nama Pelatihan
                      2: FixedColumnWidth(100), // Status
                      3: FixedColumnWidth(100), // Action
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        children: [
                          tableCell('No', isHeader: true),
                          tableCell('Nama Pelatihan', isHeader: true),
                          tableCell('Status', isHeader: true),
                          tableCell('Action', isHeader: true),
                        ],
                      ),
                      for (int i = 1;
                          i <= 10;
                          i++) // Perulangan untuk baris data
                        TableRow(
                          children: [
                            tableCell('$i'),
                            tableCell('Pelatihan $i', onPress: () {
                              // Navigasi ke halaman DetailPelatihanPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailPelatihanPage(),
                                ),
                              );
                            }),
                            tableCell(i % 2 == 0 ? 'Done' : 'On Process',
                                onPress: () {
                              //
                            }),
                            tableCell('Button $i',
                                isAction: true, onPress: () {}),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableCell(String content,
      {bool isHeader = false, bool isAction = false, Function()? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isAction
            ? ElevatedButton(
                onPressed: onPress,
                child: const Icon(Icons.delete), // Menggunakan Icon delete
              )
            : Text(
                content,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  color: isHeader ? Colors.black : Colors.black87,
                ),
              ),
      ),
    );
  }
}
