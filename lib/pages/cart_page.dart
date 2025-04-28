import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var item in cart) {
      total += int.parse(item['price'].replaceAll('.', ''));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: const Text('Keranjang'),
      ),
      body:
          cart.isEmpty
              ? const Center(child: Text('Keranjang kosong'))
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    leading: Image.asset(item['image'], width: 50, height: 50),
                    title: Text(item['title']),
                    subtitle: Text('Rp${item['price']}'),
                  );
                },
              ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Text(
          'Total: Rp${total.toString()}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
