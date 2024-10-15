import 'package:flutter/material.dart';

class DetailPelatihanBody extends StatelessWidget {
  const DetailPelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Data yang akan ditampilkan
    List<Map<String, String>> pelatihanDetails = [
      {
        'title':
            "Intelligent Manufacturing: Internet of Things (IoT), Artificial Intelligence, Digital Transformation into Industry 4.0",
        'description':
            "The training will create a proper understanding of state-of-the-art technologies such as the sensors, Internet of Things (IoT), robotic, CNC Milling Machine, real-time data collection, real-time monitoring, machine learning, and deep learning that have greatly stimulated the development of smart manufacturing. Also, digital twin (DT) and Cyber-Physical integration, which have gained extensive attention from researchers and practitioners in Industry 4.0. The Course is designed with the consideration of how emerging technologies such as Artificial Intelligence and Digital Twins are reshaping Smart Manufacturing in Industry 4.0 era. The participant will learn how to build machine and sensor integration, data collection, data analysis, AI model building, checking model trustworthiness, and testing model. In addition to teaching the concept of key technologies in smart manufacturing, this program provides hands-on skills and training on the use of tools and machines, as well as software which useful in design and build project experience.",
        'penyelenggara': "Chung Yuan Christian University",
        'durasi': "12 Hari",
        'biaya': "Dibiayai Politeknik Negeri Malang",
      }
    ];

    return Column(
      children: [
        Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pelatihanDetails.map((detail) {
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
                    buildDetailItem("Penyelenggara:", detail['penyelenggara']!),
                    buildDetailItem("Durasi Pelaksanaan:", detail['durasi']!),
                    buildDetailItem("Biaya:", detail['biaya']!),
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

