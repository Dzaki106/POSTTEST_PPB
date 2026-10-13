import 'package:flutter/material.dart';

const Color kUtama = Color(0xFF2E3FB8);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            color: kUtama,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,
                              size: 50, color: kUtama),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Pengguna',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'user@example.com',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _MenuItem(icon: Icons.person_outline, title: 'Edit Profil'),
                _MenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Riwayat Pesanan'),
                _MenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Alamat Pengiriman'),
                _MenuItem(icon: Icons.payment, title: 'Metode Pembayaran'),
                _MenuItem(icon: Icons.settings_outlined, title: 'Pengaturan'),
                _MenuItem(
                    icon: Icons.logout,
                    title: 'Keluar',
                    warnaMerah: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool warnaMerah;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.warnaMerah = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: warnaMerah ? Colors.red : kUtama),
        title: Text(
          title,
          style: TextStyle(
            color: warnaMerah ? Colors.red : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
        onTap: () {},
      ),
    );
  }
}