import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cashybara/providers/transaction_provider.dart';
// Import screen yang sudah kamu buat
import 'package:cashybara/screens/login_screen.dart';
import 'package:cashybara/screens/transaction_screen.dart';
import 'package:cashybara/screens/home_screen.dart'; // Pastikan path ini benar

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: const CashyBaraApp(),
    ),
  );
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
      // Arahkan ke Login dulu, nanti dari Login pakai Navigator ke MainNavigation
      home: const LoginScreen(), 
    );
  }
}

// --- KELAS NAVIGASI UTAMA ---
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Daftar halaman utama CashyBara
  final List<Widget> _pages = [
    const HomeScreen(),        // Layar Beranda (Layar dengan Kartu Saldo)
    const TransactionScreen(),  // Layar Riwayat Transaksi
    const Center(child: Text("Halaman Budget")),
    const Center(child: Text("Halaman Pengaturan")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF41241A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}