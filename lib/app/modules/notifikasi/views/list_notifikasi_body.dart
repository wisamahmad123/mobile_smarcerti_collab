import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/modules/notifikasi/controllers/list_notifikasi_controller.dart';

class ListNotifikasiBody extends StatelessWidget {
  final ListNotifikasiController controller =
      Get.put(ListNotifikasiController());

  ListNotifikasiBody({super.key});

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
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                }

                // Gabungkan sertifikasi dan pelatihan
                var allItems = [
                  ...controller.sertifikasis,
                  ...controller.pelatihans
                ];

                if (allItems.isEmpty) {
                  return const Center(
                      child: Text("Tidak ada notifikasi tersedia."));
                }

                return ListView.builder(
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    var item = allItems[index];
                    String title;
                    String subtitle;
                    int itemId;
                    String formattedDate = "Tanggal tidak tersedia";

                    // Cek apakah item adalah Sertifikasi atau Pelatihan
                    if (item is Sertifikasi) {
                      title = item.namaSertifikasi; // Akses nama sertifikasi
                      formattedDate = formatDate(item.tanggal);
                      subtitle = 'Sertifikasi - $formattedDate';
                      itemId = item.idSertifikasi; // ID untuk navigasi
                    } else if (item is PelatihanUser) {
                      title = item.namaPelatihan; // Akses nama pelatihan
                      formattedDate = formatDate(item.tanggal);
                      subtitle = 'Pelatihan - $formattedDate';
                      itemId = item.idPelatihan; // ID untuk navigasi
                    } else {
                      title = "Item Tidak Dikenal";
                      subtitle = "Tanggal tidak tersedia";
                      itemId = 0;
                    }

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: ListTile(
                        leading: const Icon(
                          Icons.library_books,
                          size: 35.0,
                          color: Color.fromARGB(255, 55, 94, 151),
                        ),
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Color.fromARGB(255, 55, 94, 151),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Color.fromARGB(255, 55, 94, 151),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DetailNotifikasiSertifikasi(
                          //       itemId: itemId,
                          //     ),
                          //   ),
                          // );
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
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk memformat tanggal
  String formatDate(DateTime dateTime) {
    // Format ke "EEEE, dd-MM-yyyy" (contoh: Senin, 02-12-2024)
    return DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(dateTime);
  }
}
