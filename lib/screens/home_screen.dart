import 'package:flutter/material.dart';
import '../widgets/expense_grid_item.dart';
import '../widgets/income_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40), // Balance the row
                  const Row(
                    children: [
                      Icon(Icons.chevron_left, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Bulan Ini',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.chevron_right, size: 24),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: const AssetImage('assets/capybara_profile.png'),
                    onBackgroundImageError: (exception, stackTrace) {},
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Pengeluaran Section
              RichText(
                text: const TextSpan(
                  text: 'Pengeluaran ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Rp0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Grid
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75, // Adjust for taller cards
                children: const [
                  ExpenseGridItem(
                    title: 'Makanan &\nMinuman',
                    backgroundColor: Color(0xFFFFF9DB), // Light yellow
                    iconBackgroundColor: Color(0xFFFFD54F),
                    imagePath: 'assets/capybara_food.png',
                    amount: 'Rp0',
                  ),
                  ExpenseGridItem(
                    title: 'Transportasi',
                    backgroundColor: Color(0xFFE3F2FD), // Light blue
                    iconBackgroundColor: Color(0xFF64B5F6),
                    imagePath: 'assets/capybara_transport.png',
                    amount: 'Rp0',
                  ),
                  ExpenseGridItem(
                    title: 'Tagihan\nRumah',
                    backgroundColor: Color(0xFFFFE0B2), // Light peach
                    iconBackgroundColor: Color(0xFFFFB74D),
                    imagePath: 'assets/capybara_house.png',
                    amount: 'Rp0',
                  ),
                  ExpenseGridItem(
                    title: 'Perawatan',
                    backgroundColor: Color(0xFFF3E5F5), // Light purple
                    iconBackgroundColor: Color(0xFFBA68C8),
                    imagePath: 'assets/capybara_care.png',
                    amount: 'Rp0',
                  ),
                  ExpenseGridItem(
                    title: 'Belanja',
                    backgroundColor: Color(0xFFFFEBEE), // Light pink
                    iconBackgroundColor: Color(0xFFE57373),
                    imagePath: 'assets/capybara_shop.png',
                    amount: 'Rp0',
                  ),
                  ExpenseGridItem(
                    title: 'Kesehatan',
                    backgroundColor: Color(0xFFE0F2F1), // Light teal
                    iconBackgroundColor: Color(0xFF4DB6AC),
                    imagePath: 'assets/capybara_health.png',
                    amount: 'Rp0',
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Income Section
              const Text(
                'Total Pendapatan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 48), // Extra space for overlapping image
              const IncomeCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF41241A), // Dark brown
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
