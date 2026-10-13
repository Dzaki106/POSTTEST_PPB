import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/detail_page.dart';

const Color kUtama = Color(0xFF2E3FB8);
const Color kAksen = Color(0xFFFFC107);

class ProductCard extends StatelessWidget {
  final Product produk;
  final VoidCallback onTambah;

  const ProductCard({
    super.key,
    required this.produk,
    required this.onTambah,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(produk: produk)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kUtama, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        produk.gambar,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(Icons.smart_toy,
                                  size: 24, color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      color: kAksen,
                      child: Text(
                        produk.ukuran,
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: kUtama,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: onTambah,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        color: kUtama,
                        child: const Icon(Icons.add,
                            size: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.merek.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 8,
                      letterSpacing: 0.5,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    produk.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    produk.harga,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: kUtama,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}