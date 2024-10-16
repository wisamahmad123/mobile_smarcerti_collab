import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/upload_bukti_pelatihan_page.dart';

class DetailPelatihanBody extends StatelessWidget {
  const DetailPelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> pelatihanDetails = [
      {
        'title':
            "Elite Cyber Security Lecturer Professional Development Program at TAFE Queensland",
        'waktu': "Senin, 7 Oktober 2014 - Jumat, 11 Oktober 2024",
        'lokasi': "Surabaya",
        'biaya': "Dibiayai Politeknik Negeri Malang",
        'vendor': "PT. Asia Merdeka",
        'level pelatihan': "Pelatihan Internasional",
        'jenis bidang': "Cyber Security",
      }
    ];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: pelatihanDetails.map((detail) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      detail['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Waktu:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['waktu']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Lokasi:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['lokasi']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Biaya:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['biaya']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Vendor:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['vendor']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Level Pelatihan:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['level pelatihan']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Jenis Bidang:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      detail['jenis bidang']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "File:",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF375E97),
                      ),
                    ),
                  ),
                  Container(),
                ],
              );
            }).toList(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UploadBuktiPelatihanPage()),
            );
          },
          child: Text(
            "Upload Bukti Pelatihan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Color(0xFFEF5428)),
        )
      ],
    );
  }
}
