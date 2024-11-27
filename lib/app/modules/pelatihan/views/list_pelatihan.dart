import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/detail_pelatihan_page.dart';

class ListPelatihan extends StatelessWidget {
  ListPelatihan({super.key});
  final PelatihanController controller = Get.put(PelatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Row untuk Search bar dan Filter button
            Row(
              children: [
                // Search bar
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Pelatihan',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: const Color.fromARGB(145, 255, 249, 249),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Spasi antara search dan tombol filter

                // Tombol Filter
                Container(
                  height: 54,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 255, 249, 249),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: Colors.grey[700],
                    onPressed: () {
                      // Aksi tombol Filter
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Opsi Filter"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Filter Berdasarkan Tanggal"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("Filter Berdasarkan Lokasi"),
                                  onTap: () {
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

            const SizedBox(height: 10),

            // Daftar Pelatihan
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.pelatihans.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada pelatihan tersedia."),
                  );
                }

                // Gabungkan semua data pelatihan
                var allData = controller.pelatihans.toList();

                return ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    final pelatihan = allData[index];


                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.event,
                          size: 35.0,
                          color: Color.fromARGB(255, 34, 139, 34), // Warna hijau untuk pelatihan
                        ),
                        title: Text(
                          pelatihan.namaPelatihan,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 34, 139, 34), // Warna title diperbarui
                          ),
                        ),
                        subtitle: Text(
                          "Tanggal: ${pelatihan.tanggal.toLocal()}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 34, 139, 34),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPelatihanPage(
                                idPelatihan: pelatihan.idPelatihan,
                              ),
                            ),
                          );
                        },

                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Color.fromARGB(255, 34, 139, 34),
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
