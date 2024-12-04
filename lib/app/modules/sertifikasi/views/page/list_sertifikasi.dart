import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/add_sertifikasi_page.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/detail_sertifikasi_page.dart';

class ListSertifikasi extends StatefulWidget {
  const ListSertifikasi({Key? key}) : super(key: key );

  @override
  _ListSertifikasiState createState() => _ListSertifikasiState();
}

class _ListSertifikasiState extends State<ListSertifikasi> {
  final SertifikasiController controller = Get.put(SertifikasiController());
  final TextEditingController searchController = TextEditingController();

  List<Sertifikasi> allData = [];
  List<Sertifikasi> filteredData = [];
  String? selectPeriode;

  @override
  void initState() {
    super.initState();

    setState(() {
      allData = controller.sertifikasis.toList();
      allData.sort((a, b) => a.tanggal.compareTo(b.tanggal));
      filteredData = allData;
    });
  }

  void _filterLogListBySearchText(String searchText) {
    setState(() {
      filteredData = allData
          .where((logObj) => logObj.namaSertifikasi
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _filterLogListByPeriode(String periode) {
    setState(() {
      filteredData = allData
          .where((logObj) => logObj.tanggal.year.toString() == periode)
          .toList();
    });
  }

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
                    controller: searchController,
                    onChanged: (value) {
                      _filterLogListBySearchText(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari Sertifikasi',
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

                // Tombol Filter
                Obx(() {
                  if (controller.tahunPeriode.isEmpty) {
                    return const Text('');
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(145, 255, 249, 249),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownMenu<String>(
                      initialSelection: selectPeriode,
                      onSelected: (value) {
                        selectPeriode = value;
                        _filterLogListByPeriode(selectPeriode!);
                      },
                      dropdownMenuEntries:
                          controller.tahunPeriode.map((period) {
                        return DropdownMenuEntry<String>(
                          value: period
                              .tahunPeriode, // Pastikan nama sesuai dengan model Periode
                          label: period.tahunPeriode,
                        );
                      }).toList(),
                    ),
                  );
                })
              ],
            ),
            const SizedBox(height: 10),

            // Daftar Sertifikasi
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.onRefreshSertifikasis,
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

                return ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final sertifikasi = filteredData[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.verified,
                          size: 35.0,
                          color: Color.fromARGB(255, 55, 94, 151),
                        ),
                        title: Text(
                          sertifikasi.namaSertifikasi,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(
                                255, 55, 94, 151), // Warna title diperbarui
                          ),
                        ),
                        subtitle: Text(
                          "Tanggal: ${sertifikasi.tanggal.toLocal()}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 55, 94, 151),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailSertifikasiPage(
                                idSertifikasi: sertifikasi.idSertifikasi,
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
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol "Upload" ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSertifikasiPage(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 239, 84, 40),
        foregroundColor: Colors.white, // Mengubah warna ikon menjadi putih
        child: const Icon(Icons.add),
      ),
    );
  }
}
