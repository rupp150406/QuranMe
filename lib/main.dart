import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/surah_detail_screen.dart';
import 'screens/doa_detail_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const QuranMeApp());
}

class QuranMeApp extends StatelessWidget {
  const QuranMeApp({super.key}); // Updated constructor with super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuranMe',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/surah_detail': (context) => const SurahDetailScreen(),
        '/doa_detail': (context) => const DoaDetailScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
