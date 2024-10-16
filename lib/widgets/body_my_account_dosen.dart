import 'package:flutter/material.dart';
import '../widgets/change_profile.dart';

class BodyMyAccountDosen extends StatelessWidget {
  const BodyMyAccountDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold to provide a background color
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile-dosen.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            const LabelField(
              label: 'Nama Lengkap',
              initialValue: 'Dyalifia Balqis',
            ),
            const SizedBox(height: 20),
            const LabelField(
              label: 'NIP',
              initialValue: '2241760085',
            ),
            const SizedBox(height: 20),
            const LabelField(
              label: 'Mata Kuliah',
              initialValue: 'Data Mining',
            ),
            const SizedBox(height: 20),
            const LabelField(
              label: 'Bidang Minat',
              initialValue: 'Database',
            ),
            const SizedBox(height: 20),
            const LabelField(
              label: 'Nomor Telepon',
              initialValue: '08123456780',
            ),
            const SizedBox(height: 30), // Add space before the button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeProfileScreen(),
                    ), // Navigate to MyAccountDosen
                  );
                  // Handle profile change action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xFF375E97), // Use backgroundColor instead of primary
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Change Profile',
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
    );
  }
}

class LabelField extends StatelessWidget {
  final String label;
  final String initialValue;

  const LabelField(
      {super.key, required this.label, required this.initialValue});

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
              initialValue: initialValue,
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
