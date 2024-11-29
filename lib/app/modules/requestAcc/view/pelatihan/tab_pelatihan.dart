import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/controller/req_acc_controller.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/pelatihan/req_pelatihan_detail_page.dart';


class TabPelatihan extends StatelessWidget {
  TabPelatihan({super.key});
  final ReqAccController controller = Get.put(ReqAccController());

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
                const SizedBox(width: 10), // Spasi antara search dan tombol filter

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

            // Wrap the ListView in an Expanded widget to give it bounded height
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.onRefreshPelatihans,
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
                            Icons.library_books,
                            size: 35.0,
                            color: Color.fromARGB(255, 55, 94, 151),
                          ),
                          title: Text(
                            pelatihan.namaPelatihan,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Lokasi: ${pelatihan.lokasi}\nTanggal: ${pelatihan.tanggal.toLocal().toString().substring(0, 10)}",
                            style: const TextStyle(fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReqPelatihanDetailPage(pelatihanDetail: pelatihan),
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

