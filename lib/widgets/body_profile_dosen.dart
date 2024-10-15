import 'package:flutter/material.dart';
import '../pages/LogoutDialog.dart';
import '../pages/my_account_dosen.dart';
import '../widgets/dosen_bottom_navbar.dart';
import '../widgets/app_bar_profile.dart';
import '../pages/change_password.dart';

class BodyProfileDosen extends StatelessWidget {
  const BodyProfileDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile-dosen.jpg'),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Dyalifia Balqis',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 55, 94, 151),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '2241760085',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 55, 94, 151),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Data Mining | Database',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 55, 94, 151),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'My account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAccountDosen(),
                      ), // Navigate to MyAccountDosen
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'Change Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ), // Navigate to MyAccountDosen
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    // Action for "Logout"
                    LogoutDialog.showLogoutDialog(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
