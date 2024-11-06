import 'package:flutter/material.dart';
import '../pages/list_pelatihan_detail_page.dart'; // Ganti sesuai dengan rute halaman detail sertifikasi Anda

class TabSertifikasi extends StatelessWidget {
  const TabSertifikasi({Key? key}) : super(key: key);

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
              Icons.card_membership,
              size: 35.0,
              color: Color.fromARGB(255, 55, 94, 151),
            ),
            title: const Text(
              "Certification in Data Analysis and AI",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color.fromARGB(255, 55, 94, 151),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Advanced certification in data analysis, machine learning, and AI.",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 55, 94, 151),
              ),
            ),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const ListPelatihanDetailPage(),
            //     ),
            //   );
            // },
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

// class BodySertifikasi extends StatelessWidget {
//   const BodySertifikasi({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: ListTile(
//             leading: const Icon(
//               Icons.card_membership,
//               size: 35.0,
//               color: Color.fromARGB(255, 55, 94, 151),
//             ),
//             title: const Text(
//               "Certification in Data Analysis and AI",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//                 color: Color.fromARGB(255, 55, 94, 151),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: const Text(
//               "Advanced certification in data analysis, machine learning, and AI.",
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
