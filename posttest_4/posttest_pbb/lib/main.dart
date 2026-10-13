import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

const Color kUtama = Color(0xFF2E3FB8);
const Color kAksen = Color(0xFFFFC107);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Model Kit Hobby',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: kUtama)),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = const [
      HomePage(),
      CartPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: halaman[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: kAksen.withOpacity(0.3),
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: kUtama),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Consumer<CartProvider>(
              builder: (context, cart, child) => Badge(
                isLabelVisible: cart.totalItems > 0,
                label: Text('${cart.totalItems}'),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
            selectedIcon: const Icon(Icons.shopping_bag, color: kUtama),
            label: 'Keranjang',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: kUtama),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}