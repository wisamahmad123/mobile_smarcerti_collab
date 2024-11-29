import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/controllers/list_pelatihan_controller.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/sertifikasi/detail_page/list_sertifikas_detail_page.dart';

class ListSertifikasiDosen extends StatelessWidget {
  ListSertifikasiDosen({super.key});
  final ListPelatihanController controller = Get.put(ListPelatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Row for Search bar and Filter button
            Row(
              children: [
                // Search bar
                Expanded(
                  child: TextField(
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
                ),
                const SizedBox(
                    width: 10), // Spasi antara search dan tombol filter

                // Filter button wrapped in a container for style
                Container(
                  height: 54, // Set height to match TextField
                  width: 48, // Set width to create a square container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 255, 249, 249),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: Colors.grey[700],
                    onPressed: () {
                      // Aksi ketika tombol Filter ditekan
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Filter Options"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Filter 1"),
                                  onTap: () {
                                    // Aksi filter 1
                                    Navigator.pop(context); // Close dialog
                                  },
                                ),
                                ListTile(
                                  title: const Text("Filter 2"),
                                  onTap: () {
                                    // Aksi filter 2
                                    Navigator.pop(context); // Close dialog
                                  },
                                ),
                                ListTile(
                                  title: const Text("Filter 3"),
                                  onTap: () {
                                    // Aksi filter 3
                                    Navigator.pop(context); // Close dialog
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10), // Spasi antara search dan ListView

            // Expanded agar ListView bisa scroll
            // Daftar Pelatihan
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.sertifikasis.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada sertifikasi tersedia."),
                  );
                }
                // Gabungkan semua 'Datum' dari setiap 'Pelatihan'
                var allData = controller.sertifikasis.toList();

                // Print data untuk debugging
                print("Isi allData: $allData");

                return ListView.builder(
                  itemCount: allData.length, // Jumlah total item
                  itemBuilder: (context, index) {
                    final sertifikasi = allData[index]; // Ambil satu datum

                    // Print untuk melihat isi objek datum
                    print("data pelatihan: ${sertifikasi.toString()}");

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.library_books,
                          size: 35.0,
                          color: Color.fromARGB(255, 55, 94, 151),
                        ),
                        title: Text(
                          sertifikasi.namaSertifikasi, // Ambil namaPelatihan
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Jenis Sertifikasi: ${sertifikasi.jenisSertifikasi.namaJenisSertifikasi}\nTanggal: ${sertifikasi.tanggal.toLocal().toString().substring(0, 10)}",
                          style: const TextStyle(fontSize: 14),
                        ),
                        onTap: () {
                          // Print isi dari datum yang dipilih untuk halaman detail
                          print(
                              "Pelatihan yang dipilih: ${sertifikasi.namaSertifikasi}");

                          // Navigasi ke halaman detail pelatihan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListSertifikasDetailPage(
                                  sertifikasiDetail: allData[index]),
                            ),
                          );
                        },
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Color.fromARGB(255, 55, 94, 151),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
