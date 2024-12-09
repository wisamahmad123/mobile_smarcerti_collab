import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/home/views/chart_total_pelatihan_sertif_dosen.dart';
import 'menu_item_card.dart';
import 'chart_pengguna.dart';

class HomeBody extends StatelessWidget {
  final String role; // Tambahkan parameter untuk role pengguna
  final HomeController controller = Get.put(HomeController());
  HomeBody({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Data menu untuk setiap role
    final List<Map<String, dynamic>> menuData = (role == 'pimpinan')
        ? [
            {'text': 'Pelatihan', 'icon': Icons.school_outlined},
            {'text': 'Sertifikasi', 'icon': Icons.workspace_premium},
            {
              'text': 'Daftar Pelatihan dan Sertifikasi Dosen',
              'icon': Icons.list_sharp
            },
          ]
        : [
            {'text': 'Pelatihan', 'icon': Icons.school_outlined},
            {'text': 'Sertifikasi', 'icon': Icons.workspace_premium},
          ];

    return Scaffold(
      backgroundColor: Colors.white, // Pastikan warna latar belakang putih
      body: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: controller.onRefresh,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Menu Grid
              Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  shrinkWrap: true, // Agar GridView mengikuti kontennya
                  physics:
                      const NeverScrollableScrollPhysics(), // Non-scrollable GridView
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    crossAxisSpacing: 25, // Jarak antar kolom
                    mainAxisSpacing: 25, // Jarak antar baris
                    childAspectRatio: 1.4, // Rasio lebar dan tinggi tiap item
                  ),
                  itemCount: menuData.length, // Jumlah item berdasarkan data menu
                  itemBuilder: (context, index) {
                    var data = menuData[index];
                    return MenuItemCard(data: data); // Widget untuk kartu menu
                  },
                ),
              ),

              // Bagian Obx untuk Chart
              Obx(() {
                if (controller.isLoading.value) {
                  // Tampilkan indikator loading
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // Tampilkan data setelah loading selesai
                  return Column(
                    children: [
                      // Chart Pengguna
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ChartPengguna(),
                      ),

                      // Chart Total Pelatihan dan Sertifikasi Dosen (Khusus untuk role pimpinan)
                      if (role == 'pimpinan') // Hanya tampil jika role adalah pimpinan
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ChartTotalPelatihanSertifDosen(),
                        ),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
      )
    );
    
  }
}
