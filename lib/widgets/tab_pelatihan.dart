import 'package:flutter/material.dart';
import '../pages/list_pelatihan_detail_page.dart'; // Ganti sesuai dengan rute halaman detail pelatihan Anda

class TabPelatihan extends StatelessWidget {
  const TabPelatihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListTile(
            leading: const Icon(
              Icons.library_books,
              size: 35.0,
              color: Color.fromARGB(255, 55, 94, 151),
            ),
            title: const Text(
              "Intelligent Manufacturing: IoT, AI, Digital Transformation",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color.fromARGB(255, 55, 94, 151),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Internet of Things (IoT), Artificial Intelligence, and Digital Transformation into Industry 4.0.",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 55, 94, 151),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPelatihanDetailPage(),
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
}


// import 'package:flutter/material.dart';
// import '../pages/list_pelatihan_detail_page.dart'; // Ganti sesuai dengan rute halaman detail pelatihan Anda

// class TabPelatihan extends StatelessWidget {
//   const TabPelatihan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: ListTile(
//             leading: const Icon(
//               Icons.library_books,
//               size: 35.0,
//               color: Color.fromARGB(255, 55, 94, 151),
//             ),
//             title: const Text(
//               "Intelligent Manufacturing: IoT, AI, Digital Transformation",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//                 color: Color.fromARGB(255, 55, 94, 151),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: const Text(
//               "Internet of Things (IoT), Artificial Intelligence, and Digital Transformation into Industry 4.0.",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 55, 94, 151),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
