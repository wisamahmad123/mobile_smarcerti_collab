import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/detail_rekom_pelatihan_page.dart';


class RekomPelatihanBody extends StatelessWidget {
  const RekomPelatihanBody({super.key});

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
              MaterialPageRoute(builder: (context) => const DetailRekomPelatihanPage()),
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
