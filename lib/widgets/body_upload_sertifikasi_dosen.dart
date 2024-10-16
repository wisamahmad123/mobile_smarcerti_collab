import 'package:flutter/material.dart';

class BodyUploadSertifikasiDosen extends StatelessWidget {
  const BodyUploadSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputField(label: 'Nama Sertifikasi'),
            const SizedBox(height: 20),
            const InputField(label: 'Nomor Sertifikat'),
            const SizedBox(height: 20),
            const DropdownField(label: 'Jenis Sertifikasi'),
            const SizedBox(height: 20),
            const InputField(label: 'Tanggal'),
            const SizedBox(height: 20),
            const InputField(label: 'Vendor Sertifikasi'),
            const SizedBox(height: 20),
            const InputField(label: 'Masa Berlaku'),
            const SizedBox(height: 20),
            const DropdownField(label: 'Jenis Bidang'),
            const SizedBox(height: 20),
            const DropdownField(label: 'Jenis Sertifikasi'),
            const SizedBox(height: 20),
            const FilePickerField(label: 'File'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
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
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;

  const DropdownField({super.key, required this.label});

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
        DropdownButtonFormField<String>(
        items: const [
          DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
          DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
        ],
        onChanged: (value) {},
        dropdownColor: Colors.white, 
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
              flex: 5,
              child: Container(
                height: 50,
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
              flex: 2,
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
