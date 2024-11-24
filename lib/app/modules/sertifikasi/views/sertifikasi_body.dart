import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_sertifikasi.dart';

class SertifikasiBody extends StatelessWidget {
  const SertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  ListSertifikasi(), // Menampilkan ListSertifikasi sebagai body halaman
    );
  }
}


/*class SertifikasiBody extends StatelessWidget {
  final Sertifikasi sertifikasiDetail; // Objek detail sertifikasi

  SertifikasiBody({
    super.key,
    required this.sertifikasiDetail,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Sertifikasi
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              sertifikasiDetail.namaSertifikasi,
              maxLines: 3,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF375E97),
              ),
            ),
          ),

          // Deskripsi Pelatihan
          buildDetailItem("Jenis Pelatihan:", sertifikasiDetail.jenis),
          buildDetailItem("Kuota:", sertifikasiDetail.kuotaPeserta),
          buildDetailItem("Tanggal:", sertifikasiDetail.tanggal.toLocal().toString()),
          buildDetailItem("Biaya:", sertifikasiDetail.biaya),
          buildDetailItem("Vendor:", sertifikasiDetail.vendorSertifikasi.nama),
          buildDetailItem("Bidang Minat:", sertifikasiDetail.bidangMinatSertifikasi.isEmpty
              ? "Tidak ada"
              : sertifikasiDetail.bidangMinatSertifikasi.map((e) => e.namaBidangMinat).join(", ")),
          buildDetailItem("Mata Kuliah:", sertifikasiDetail.mataKuliahSertifikasi.isEmpty
              ? "Tidak ada"
              : sertifikasiDetail.mataKuliahSertifikasi.map((e) => e.namaMatakuliah).join(", ")),
          buildDetailItem("Nama Peserta:", sertifikasiDetail.detailPesertaSertifikasi.isEmpty
              ? "Tidak ada"
              : sertifikasiDetail.detailPesertaSertifikasi.map((e) => e.namaLengkap).join(", ")),
        ],
      ),
    );
  }

  // Widget untuk menampilkan detail item secara dinamis
  Widget buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "$label $value",
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          color: Color(0xFF375E97),
        ),
      ),
    );
  }
}

class SertifikasiBody extends StatefulWidget {
  const SertifikasiBody({super.key});

  @override
  __SertifikasiScreenState createState() => __SertifikasiScreenState();
}

class __SertifikasiScreenState extends State<SertifikasiBody> {
  late Future<List<dynamic>> _sertifikasiFuture;

  @override
  void initState() {
    super.initState();
    _sertifikasiFuture = ApiService().fetchSertifikasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: const Color.fromARGB(145, 255, 249, 249),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 54,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 255, 249, 249),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: Colors.grey[700],
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Filter Options"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Filter 1"),
                                  onTap: () => Navigator.pop(context),
                                ),
                                ListTile(
                                  title: const Text("Filter 2"),
                                  onTap: () => Navigator.pop(context),
                                ),
                                ListTile(
                                  title: const Text("Filter 3"),
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _sertifikasiFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final sertifikasis = snapshot.data!;
                    return ListView.builder(
                      itemCount: sertifikasis.length,
                      itemBuilder: (context, index) {
                        final sertifikasi = sertifikasis[index];
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: ListTile(
                            leading: const Icon(
                              Icons.library_books,
                              size: 35.0,
                              color: Color.fromARGB(255, 55, 94, 151),
                            ),
                            title: Text(
                              sertifikasi['nama_sertifikasi'],
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color.fromARGB(255, 55, 94, 151),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailSertifikasi(
                                    idSertifikasi: sertifikasi['id_sertifikasi'],
                                  ),
                                ),
                              );
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                              color: Color.fromARGB(255, 55, 94, 151),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
