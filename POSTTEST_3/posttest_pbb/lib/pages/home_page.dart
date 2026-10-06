import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

const Color kUtama = Color(0xFF2E3FB8);

class HomePage extends StatefulWidget {
  final void Function(int indexProduk) onTambah;

  const HomePage({super.key, required this.onTambah});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  List<Product> get visibleProducts {
    if (searchQuery.isEmpty) return daftarProduk;
    return daftarProduk
        .where((p) => p.nama.toLowerCase().contains(searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'MODEL KIT HOBBY',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: kUtama,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SearchSection(
                onChanged: (value) {
                  setState(() => searchQuery = value.toLowerCase());
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Produk Terbaru',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kUtama,
                ),
              ),
              const SizedBox(height: 12),
              if (visibleProducts.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text(
                      'Produk tidak ditemukan',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: visibleProducts.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final produk = visibleProducts[index];
                    final indexAsli = daftarProduk.indexOf(produk);
                    return ProductCard(
                      produk: produk,
                      onTambah: () => widget.onTambah(indexAsli),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchSection({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Cari model kit',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(Icons.search,
                    size: 24, color: Colors.grey.shade400),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: kUtama, width: 1.5),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kUtama,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 22),
        ),
      ],
    );
  }
}