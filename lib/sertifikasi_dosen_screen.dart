import 'package:flutter/material.dart';
import 'services/sertifikasi_api_service.dart';
import 'detail_sertifikasi_screen.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
          Transform.translate(
            offset: const Offset(-5, 0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SertifikasiDosenScreen extends StatefulWidget {
  const SertifikasiDosenScreen({super.key});

  @override
  __SertifikasiDosenScreenState createState() => __SertifikasiDosenScreenState();
}

class __SertifikasiDosenScreenState extends State<SertifikasiDosenScreen> {
  late Future<List<dynamic>> _sertifikasiFuture;

  @override
  void initState() {
    super.initState();
    _sertifikasiFuture = SertifikasiApiService().fetchSertifikasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Daftar Sertifikasi"),
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
                                  builder: (context) => DetailDosenScreen(
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
}
