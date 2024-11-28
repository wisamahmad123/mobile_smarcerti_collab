import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:mobile_smarcerti/app/modules/change_profile/views/change_profile_page.dart';

class BodyMyAccountDosen extends StatelessWidget {
  BodyMyAccountDosen({super.key});
  final MyAccountController controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.myAccounts.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final account = controller.myAccounts.first;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: account.avatarUrl.isNotEmpty
                      ? NetworkImage(account.avatarUrl) // Gambar dari URL
                      : AssetImage('assets/images/profile-dosen.jpg')
                          as ImageProvider, // Gambar default
                ),
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Nama Lengkap',
                initialValue: account.namaLengkap,
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Username',
                initialValue: account.username,
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Mata Kuliah',
                initialValue: account.detailDaftarUserMatakuliah.isEmpty
                    ? "Tidak ada"
                    : account.detailDaftarUserMatakuliah
                        .map((e) => e.namaMatakuliah)
                        .join(", "),
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Bidang Minat',
                initialValue: account.detailDaftarUserBidangMinat.isEmpty
                    ? "Tidak ada"
                    : account.detailDaftarUserBidangMinat
                        .map((e) => e.namaBidangMinat)
                        .join(", "),
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Nomor Telepon',
                initialValue: account.noTelp,
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Email',
                initialValue: account.email,
              ),
              const SizedBox(height: 20),
              LabelField(
                label: 'Jenis Kelamin',
                initialValue: account.jenisKelamin,
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeProfilePage(),
                      ),
                    );
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
                    'Change Profile',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
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
              readOnly: true,
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
