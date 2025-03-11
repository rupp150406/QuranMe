import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Image
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.person, size: 80, color: Colors.green),
            ),

            const SizedBox(height: 24),

            // Developer Info
            const Text(
              'Pengembang Aplikasi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            const Text(
              'QuranMe Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(
                      128,
                      128,
                      128,
                      0.2,
                    ), // Grey color with 20% opacity
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.green),
                    title: Text('Email'),
                    subtitle: Text('developer@quranme.app'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.code, color: Colors.green),
                    title: Text('Dibuat dengan'),
                    subtitle: Text('Flutter & Dart'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.green),
                    title: Text('Versi Aplikasi'),
                    subtitle: Text('1.0.0'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // About App
            const Text(
              'Tentang Aplikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'QuranMe adalah aplikasi Al-Quran dan Doa yang dibuat untuk memudahkan pengguna dalam membaca Al-Quran dan menghafalkan doa-doa sehari-hari. Aplikasi ini menggunakan API dari santrikoding.com dan open-api.my.id.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
