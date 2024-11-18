import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/detail_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';

class DetailSertifikasi extends StatefulWidget {
  final int idSertifikasi;

  const DetailSertifikasi({Key? key, required this.idSertifikasi})
      : super(key: key);

  @override
  _DetailSertifikasiState createState() => _DetailSertifikasiState();
}

class _DetailSertifikasiState extends State<DetailSertifikasi> {
  late Future<Map<String, dynamic>> _detailFuture;
  @override
  void initState() {
    super.initState();
    _detailFuture = ApiService().fetchDetailSertifikasi(widget.idSertifikasi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final detail = snapshot.data!;
            return DetailSertifikasiBody(detail: detail);
          }
        },
      ),
    );
  }
}

class DetailSertifikasiBody extends StatelessWidget {
  final Map<String, dynamic> detail;

  const DetailSertifikasiBody({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Detail Sertifikasi",
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              detail['nama_sertifikasi'],
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color(0XFF375E97),
              ),
            ),
            const SizedBox(height: 10),
            _buildDetailItem("Tanggal:", detail['tanggal']),
            _buildDetailItem("Lokasi:", detail['vendor_sertifikasi']['alamat']),
            _buildDetailItem("Biaya:", detail['biaya'].toString()),
            _buildDetailItem("Vendor:", detail['vendor_sertifikasi']['nama']),
            _buildDetailItem("Jenis Sertifikasi:", detail['jenis']),
            _buildDetailItem(
              "Bidang Minat:",
              (detail['bidang_minat_sertifikasi'] as List)
                  .map((bm) => bm['nama_bidang_minat'])
                  .join(', '),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0XFF375E97),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: Color(0XFF375E97),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
