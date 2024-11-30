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
                    onChanged: (query) =>
                        controller.searchSertifikasi(query), // Panggil fungsi pencarian
                  ),
                ),
                const SizedBox(width: 10),

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
                                  title: const Text("Semua"),
                                  onTap: () {
                                    controller.filterPeriodeSertifikasi("Semua");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("2024"),
                                  onTap: () {
                                    controller.filterPeriodeSertifikasi("2024");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("2025"),
                                  onTap: () {
                                    controller.filterPeriodeSertifikasi("2025");
                                    Navigator.pop(context);
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
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.onRefreshSertifikasis,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.filteredSertifikasi.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada sertifikasi tersedia."),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredSertifikasi.length,
                  itemBuilder: (context, index) {
                    final sertifikasi = controller.filteredSertifikasi[index];

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
                          sertifikasi.namaSertifikasi,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListSertifikasDetailPage(
                                sertifikasiDetail: sertifikasi,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
