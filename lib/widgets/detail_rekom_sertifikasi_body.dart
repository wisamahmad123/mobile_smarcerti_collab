import 'package:flutter/material.dart';

class DetailRekomSertifikasiBody extends StatelessWidget {
  const DetailRekomSertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Data yang akan ditampilkan
    List<Map<String, String>> rekomSertifikasiDetails = [
      {
        'title':
            "Intelligent Manufacturing: Internet of Things (IoT), Artificial Intelligence, Digital Transformation into Industry 4.0",
        'description':
            "Pelatihan Internasional",
        'kuota': "5 Orang",
        'waktu': "Senin, 7 Oktober 2014 - Jumat, 11 Oktober 2024",
        'lokasi': "Surabaya",
        'biaya': "Dibiayai Politeknik Negeri Malang",
        'vendor': "PT. Asia Merdeka",
        'bidang minat': " Internet of Things",
        'mata kuliah': "Mobile Programming",
      }
    ];

    return Column(
      children: [
        Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rekomSertifikasiDetails.map((detail) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        detail['title']!,
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xFF375E97),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Description:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xFF375E97),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        detail['description']!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xFF375E97),
                        ),
                      ),
                    ),
                    buildDetailItem("Kuota:", detail['kuota']!),
                    buildDetailItem("Waktu:", detail['waktu']!),
                    buildDetailItem("Lokasi:", detail['lokasi']!),
                    buildDetailItem("Biaya:", detail['biaya']!),
                    buildDetailItem("Vendor:", detail['vendor']!),
                    buildDetailItem("Bidang Minat:", detail['bidang minat']!),
                    buildDetailItem("Mata Kuliah:", detail['mata kuliah']!),
                  ],
                );
              }).toList(),
            ),
          ),
          height: 400,
        ),
      ],
    );
  }

  // Method untuk membuat Text dan isinya secara dinamis
  Widget buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        "$label $value",
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          color: Color(0xFF375E97),
        ),
      ),
    );
  }

  }

