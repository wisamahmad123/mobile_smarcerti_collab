// import 'package:flutter/material.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/views/detail_pelatihan_page.dart';
// import 'package:mobile_smarcerti/pages/upload_pelatihan_page.dart';

// class PelatihanBody extends StatelessWidget {
//   const PelatihanBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search bar
//            Row(
//               children: [
//                 // Search bar
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       fillColor: const Color.fromARGB(145, 255, 249, 249),
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10), // Spasi antara search dan tombol filter
                
//                 // Filter button wrapped in a container for style
//                 Container(
//                   height: 54, // Set height to match TextField
//                   width: 48, // Set width to create a square container
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(145, 255, 249, 249),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: IconButton(
//                     icon: const Icon(Icons.filter_list),
//                     color: Colors.grey[700],
//                     onPressed: () {
//                       // Aksi ketika tombol Filter ditekan
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text("Filter Options"),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 ListTile(
//                                   title: const Text("Filter 1"),
//                                   onTap: () {
//                                     // Aksi filter 1
//                                     Navigator.pop(context); // Close dialog
//                                   },
//                                 ),
//                                 ListTile(
//                                   title: const Text("Filter 2"),
//                                   onTap: () {
//                                     // Aksi filter 2
//                                     Navigator.pop(context); // Close dialog
//                                   },
//                                 ),
//                                 ListTile(
//                                   title: const Text("Filter 3"),
//                                   onTap: () {
//                                     // Aksi filter 3
//                                     Navigator.pop(context); // Close dialog
//                                   },
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 10), // Spasi antara filter button dan ListView

//             // Expanded agar ListView bisa scroll
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5, // Jumlah item
//                 itemBuilder: (context, index) {
//                   return Card(
//                     color: Colors.white,
//                     margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10), // Margin untuk kartu
//                     child: Container(
//                       width: 150,
//                       height: 170, // Atur tinggi kartu di sini
//                       child: ListTile(
//                         leading: const Icon(
//                           Icons.library_books,
//                           size: 35.0,
//                           color: Color.fromARGB(255, 55, 94, 151),
//                         ),
//                         title: const Text(
//                           "Intelligent Manufacturing: IoT, AI, Digital Transformation", // Judul pelatihan
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontSize: 16, // Ukuran font judul
//                             color: Color.fromARGB(255, 55, 94, 151),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: const Text(
//                           "Internet of Things (IoT), Artificial Intelligence, and Digital Transformation into Industry 4.0.", // Deskripsi pelatihan
//                           style: TextStyle(
//                             fontSize: 14, // Ukuran font deskripsi
//                             color: Color.fromARGB(255, 55, 94, 151),
//                           ),
//                         ),
//                         onTap: () {
//                           // Navigasi ke halaman detail pelatihan
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const DetailPelatihanPage(),
//                             ),
//                           );
//                         },
//                         trailing: const Icon(
//                           Icons.arrow_forward_ios,
//                           size: 20.0,
//                           color: Color.fromARGB(255, 55, 94, 151),
//                         ),
//                         contentPadding: const EdgeInsets.all(20),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Aksi ketika tombol "Upload" ditekan
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const UploadPelatihanPage(),
//             ),
//           );
//         },
//         backgroundColor: const Color.fromARGB(255, 239, 84, 40),
//         foregroundColor: Colors.white, // Mengubah warna ikon menjadi putih
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
