// widgets/home_body.dart
import 'package:flutter/material.dart';
import 'menu_item_card.dart';
import 'analytics_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kontainerData = [
      {'text': 'Daftar Dosen', 'icon': Icons.list},
      {'text': 'Dosen Aktif', 'icon': Icons.person},
      {'text': 'Dosen Tidak Aktif', 'icon': Icons.person},
      {'text': 'Bidang', 'icon': Icons.work},
      {'text': 'Delegasi Dosen', 'icon': Icons.person},
    ];

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
          const AnalyticsContainer(),
        ],
      ),
    );
  }
}
