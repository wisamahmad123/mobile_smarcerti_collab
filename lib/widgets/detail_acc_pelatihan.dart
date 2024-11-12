import 'package:flutter/material.dart';

class DetailACCPelatihanBody extends StatelessWidget {
  const DetailACCPelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> pelatihanDetails = [
      {
        'title':
            "Intelligent Manufacturing: Internet of Things (IoT), Artificial Intelligence, Digital Transformation into Industry 4.0",
        'waktu': "Senin, 7 Oktober 2014 - Jumat, 11 Oktober 2024",
        'lokasi': "Surabaya",
        'biaya': "Dibiayai Politeknik Negeri Malang",
        'vendor': "PT. Asia Merdeka",
        'level pelatihan': "Pelatihan Internasional",
        'jenis bidang': "Cyber Security",
        'mata kuliah': "Network Programming"
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // Map detail pelatihan ke widget
            ...pelatihanDetails.map((detail) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF375E97),
                    ),
                  ),
                  SizedBox(height: 8),
                  buildDetailRow("Waktu:", detail['waktu']!),
                  buildDetailRow("Lokasi:", detail['lokasi']!),
                  buildDetailRow("Biaya:", detail['biaya']!),
                  buildDetailRow("Vendor:", detail['vendor']!),
                  buildDetailRow(
                      "Level Pelatihan:", detail['level pelatihan']!),
                  buildDetailRow("Jenis Bidang:", detail['jenis bidang']!),
                  buildDetailRow("Mata Kuliah:", detail['mata kuliah']!),
                  SizedBox(height: 16),
                  buildDosenTable(),
                ],
              );
            }).toList(),
            Spacer(),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const UploadBuktiPelatihanPage()),
            //     );
            //   },
            //   child: Text(
            //     "Selesai",
            //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //       minimumSize: Size(double.infinity, 50),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       backgroundColor: Color(0xFFEF5428)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0XFF375E97),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: Color(0XFF375E97),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildDosenTable() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
            },
            border: TableBorder.all(color: Colors.grey.shade300),
            children: [
              TableRow(
                children: [
                  Center(child: Text('No')),
                  Center(child: Text('Nama Dosen')),
                  Center(child: Text('Status')),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text('1')),
                  Center(child: Text('Dosen 1')),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.green.shade100,
                      child: Text(
                        'Diterima',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text('2')),
                  Center(child: Text('Dosen 1')),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.red.shade100,
                      child: Text(
                        'Ditolak',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
