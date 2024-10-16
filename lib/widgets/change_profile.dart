import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Tambahkan untuk memilih gambar
import '../widgets/popup.dart';

class ChangeProfileScreen extends StatefulWidget {
  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  // Controller untuk input field
  final TextEditingController nameController =
      TextEditingController(text: 'Dyalifa Balqis');
  final TextEditingController nipController =
      TextEditingController(text: '2241760085');
  final TextEditingController subjectController =
      TextEditingController(text: 'Data Mining');
  final TextEditingController interestController =
      TextEditingController(text: 'Database');
  final TextEditingController phoneController =
      TextEditingController(text: '09876554321');

  // Menyimpan gambar profil
  String? profileImagePath;

  // Mengambil gambar dari galeri
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImagePath = image.path; // Menyimpan path gambar yang dipilih
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF5428),
        title: Text(
          'Change Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: profileImagePath != null
                          ? AssetImage(
                              profileImagePath!) // Menampilkan gambar profil jika ada
                          : AssetImage(
                              'assets/images/profile-dosen.jpg'), // Gambar default
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt,
                            color: Colors.white, size: 24),
                        onPressed: pickImage, // Memilih gambar
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              LabelField(
                  label: 'Nama Lengkap',
                  controller: TextEditingController(text: 'Dyalifa Balqis')),
              SizedBox(height: 20),
              LabelField(
                  label: 'NIP',
                  controller: TextEditingController(text: '2241760085')),
              SizedBox(height: 20),
              LabelField(
                  label: 'Mata Kuliah',
                  controller: TextEditingController(text: 'Data Mining')),
              SizedBox(height: 20),
              LabelField(
                  label: 'Bidang Minat',
                  controller: TextEditingController(text: 'Database')),
              SizedBox(height: 20),
              LabelField(
                  label: 'Nomor Telepon',
                  controller: TextEditingController(text: '09876554321')),
              SizedBox(height: 30), // Space before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Popup.showChangeProfileDialog(
                        context); // Memanggil metode dialog
                    // Handle save action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF375E97),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const LabelField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Card(
          color: Colors.white,
          elevation: 1,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF375E97),
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
