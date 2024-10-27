import 'package:flutter/material.dart';

class BodyUpBuktiPelatihanPimpinan extends StatelessWidget {
  const BodyUpBuktiPelatihanPimpinan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputField(label: 'No Sertifikat'),
            const SizedBox(height: 20),
            const InputField(label: 'Tanggal'),
            const SizedBox(height: 20),
            const FilePickerField(label: 'File'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Menempatkan tombol di sisi kanan
              children: [
                SizedBox(
                  width: 120, // Mengatur lebar yang sama untuk tombol Cancel
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle Cancel action
                      print("Cancel button clicked");
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 239, 84, 40),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 84, 40),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Menambahkan jarak antara kedua tombol
                SizedBox(
                  width: 120, // Mengatur lebar yang sama untuk tombol Save
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Save action
                      print("Save button clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;

  const InputField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 94, 151),
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilePickerField extends StatelessWidget {
  final String label;

  const FilePickerField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 94, 151),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 5, // Mengambil 5 bagian dari total 6
              child: Container(
                height: 50, // Tinggi yang sama dengan tombol
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(
                    'No file selected',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2, // Mengambil 2 bagian dari total 6
              child: ElevatedButton(
                onPressed: () {
                  // Handle file picker action
                  print("Choose File button clicked");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 55, 94, 151),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  'Choose File',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}