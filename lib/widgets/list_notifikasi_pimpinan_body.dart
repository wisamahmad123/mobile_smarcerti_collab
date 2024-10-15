import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/detail_notifikasi_pimpinan_page.dart';

class ListNotifikasiPimpinanBody extends StatelessWidget {
  const ListNotifikasiPimpinanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.library_books,
              size: 35.0,
            ),
            subtitle: const Text(
                "Intelligent Manufacturing: Internet of Things (IoT), Artificial Intelligence, Digital Transformation into Industry 4.0"),
            onTap: () {
                          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailNotifikasiPimpinan()),
            );
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 35.0,
            ),
            contentPadding: const EdgeInsets.all(20),
          );
        },
      ),
    );
  }
}
