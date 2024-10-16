import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/detail_rekom_sertif_page.dart';

class RekomSertifBody extends StatelessWidget {
  const RekomSertifBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/pelatihan_1.png',
      'assets/images/pelatihan_2.png',
      'assets/images/pelatihan_3.png',
    ];

    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailRekomSertifPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: Image.asset(
                images[index],
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
        );
      },
    );
  }
}
