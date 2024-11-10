import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/up_bukti_sertifikasi_dosen.dart';

class DetailSertifikasiBody extends StatelessWidget {
  const DetailSertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> sertifikasiDetails = [
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            ...sertifikasiDetails.map((detail) {
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
                      "Tanggal:",
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
                      "Jenis Sertifikasi:",
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
                      detail['jenis sertifikasi']!,
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
            // Elevated button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpBuktiSertifikasiDosen()),
                );
              },
              child: Text(
                "Upload Bukti Sertifikasi",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Color(0xFFEF5428)),
            ),
          ],
        ),
      ),
    );
  }
}
