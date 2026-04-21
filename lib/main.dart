import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const CashyBaraApp());
}

class CashyBaraApp extends StatelessWidget {
  const CashyBaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashyBara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF41241A)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
