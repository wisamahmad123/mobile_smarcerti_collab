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


// import 'package:flutter/material.dart';
// import '../models/pelatihan_model.dart'; // Import the Pelatihan model
// import '../services/pelatihan_service.dart'; // Import the PelatihanService to fetch data
// import '../pages/list_pelatihan_detail_page.dart';

// class TabPelatihan extends StatefulWidget {
//   const TabPelatihan({Key? key}) : super(key: key);

//   @override
//   _TabPelatihanState createState() => _TabPelatihanState();
// }

// class _TabPelatihanState extends State<TabPelatihan> {
//   late Future<List<Pelatihan>> pelatihanList;

//   @override
//   void initState() {
//     super.initState();
//     pelatihanList = PelatihanService.fetchPelatihanList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Pelatihan>>(
//       future: pelatihanList,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No data available'));
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               Pelatihan pelatihan = snapshot.data![index];
//               return Card(
//                 color: Colors.white,
//                 margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 2,
//                 child: ListTile(
//                   leading: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 55, 94, 151),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Icon(
//                       Icons.event_note,
//                       size: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   title: Text(
//                     pelatihan.namaPelatihan,
//                     style: const TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   trailing: const Icon(
//                     Icons.arrow_forward_ios,
//                     size: 16,
//                     color: Colors.grey,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ListPelatihanDetailPage(),
//                       ),
//                     );
//                   },
//                   contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20, vertical: 8),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
