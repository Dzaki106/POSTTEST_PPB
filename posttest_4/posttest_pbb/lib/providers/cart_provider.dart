import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, int> _keranjang = {};

  Map<int, int> get keranjang => _keranjang;

  int get totalItems =>
      _keranjang.values.fold(0, (sum, qty) => sum + qty);

  int get grandTotal {
    int total = 0;
    _keranjang.forEach((index, qty) {
      final hargaStr = daftarProduk[index].harga
          .replaceAll('Rp', '')
          .replaceAll('.', '');
      total += (int.tryParse(hargaStr) ?? 0) * qty;
    });
    return total;
  }

  void tambah(int indexProduk) {
    _keranjang[indexProduk] = (_keranjang[indexProduk] ?? 0) + 1;
    notifyListeners();
  }

  void ubahQty(int indexProduk, int qty) {
    if (qty <= 0) {
      _keranjang.remove(indexProduk);
    } else {
      _keranjang[indexProduk] = qty;
    }
    notifyListeners();
  }
}