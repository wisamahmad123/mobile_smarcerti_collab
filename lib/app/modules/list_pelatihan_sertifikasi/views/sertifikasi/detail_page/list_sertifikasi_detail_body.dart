import 'package:flutter/material.dart';

class ListSertifikasiDetailBody extends StatelessWidget {
  const ListSertifikasiDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Data yang akan ditampilkan
    List<Map<String, String>> listSertifikasiDetails = [
      {
        'title':
            "Elite Cyber Security Lecturer Professional Development Program at TAFE Queensland",
        'waktu': "Senin, 7 Oktober 2014 - Jumat, 11 Oktober 2024",
        'lokasi': "Surabaya",
        'biaya': "Dibiayai Politeknik Negeri Malang",
        'vendor': "PT. Asia Merdeka",
        'jenis sertifikasi': "Sertifikasi Keahlian", // Update this if necessary
        'jenis bidang': "Cyber Security",
      }
    ];

    return Column(
      children: [
        Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listSertifikasiDetails.map((detail) {
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
                    buildDetailItem("Waktu:", detail['waktu']!),
                    buildDetailItem("Lokasi:", detail['lokasi']!),
                    buildDetailItem("Biaya:", detail['biaya']!),
                    buildDetailItem("Vendor:", detail['vendor']!),
                    buildDetailItem("jenis sertifikasi:", detail['jenis sertifikasi']!),
                    buildDetailItem("jenis bidang:", detail['jenis bidang']!),
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

