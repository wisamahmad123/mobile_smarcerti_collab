import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/detail_notifikasi_sertifikasi.dart';

class ListNotifikasiBody extends StatelessWidget {
  const ListNotifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Expanded agar ListView bisa scroll
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Jumlah item
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10), // Margin untuk kartu
                    child: ListTile(
                      leading: const Icon(
                        Icons.library_books,
                        size: 35.0,
                        color: Color.fromARGB(255, 55, 94, 151),
                      ),
                      title: const Text(
                        "Intelligent Manufacturing: IoT, AI, Digital Transformation", // Judul pelatihan
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16, // Ukuran font judul
                          color: Color.fromARGB(255, 55, 94, 151),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Navigasi ke halaman detail pelatihan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DetailNotifikasiSertifikasi(),
                          ),
                        );
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Color.fromARGB(255, 55, 94, 151),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
