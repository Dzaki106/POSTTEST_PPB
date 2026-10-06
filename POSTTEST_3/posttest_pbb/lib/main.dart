import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

const Color kUtama = Color(0xFF2E3FB8);
const Color kAksen = Color(0xFFFFC107);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  final Map<int, int> _keranjang = {};

  int get _totalItems =>
      _keranjang.values.fold(0, (sum, qty) => sum + qty);

  void _tambahKeKeranjang(int indexProduk) {
    setState(() {
      _keranjang[indexProduk] = (_keranjang[indexProduk] ?? 0) + 1;
    });
  }

  void _ubahQty(int indexProduk, int qty) {
    setState(() {
      if (qty <= 0) {
        _keranjang.remove(indexProduk);
      } else {
        _keranjang[indexProduk] = qty;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      HomePage(onTambah: _tambahKeKeranjang),
      CartPage(
        keranjang: _keranjang,
        onUbahQty: _ubahQty,
      ),
      const ProfilePage(),
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
            icon: Badge(
              isLabelVisible: _totalItems > 0,
              label: Text('$_totalItems'),
              child: const Icon(Icons.shopping_bag_outlined),
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