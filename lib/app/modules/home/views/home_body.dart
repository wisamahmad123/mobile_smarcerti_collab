import 'package:flutter/material.dart';
import 'menu_item_card.dart';
import 'analytics_container.dart';

class HomeBody extends StatelessWidget {
  final String role; // Tambahkan parameter untuk role pengguna

  const HomeBody({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // icon sementara bingung
    // Data untuk role dosen
    final List<Map<String, dynamic>> dosenData = [
      {'text': 'Pelatihan', 'icon': Icons.school_outlined},
      {'text': 'Sertifikasi', 'icon': Icons.workspace_premium},
    ];

    // Data untuk role pimpinan
    final List<Map<String, dynamic>> pimpinanData = [
      {'text': 'Pelatihan', 'icon': Icons.school_outlined},
      {'text': 'Sertifikasi', 'icon': Icons.workspace_premium},
      {'text': 'Daftar Pelatihan dan Sertifikasi Dosen', 'icon': Icons.list_sharp},
    ];

    // Percabangan berdasarkan role
    final List<Map<String, dynamic>> kontainerData =
        (role == 'pimpinan') ? pimpinanData : dosenData;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 1.4,
              ),
              itemCount: kontainerData.length,
              itemBuilder: (context, index) {
                var data = kontainerData[index];
                return MenuItemCard(data: data);
              },
            ),
          ),
          const SizedBox(height: 300, child: AnalyticsContainer()),
        ],
      ),
    );
  }
}
