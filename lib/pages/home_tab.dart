import 'package:flutter/material.dart';
import '../data/product_list.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class HomeTab extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;
  const HomeTab({super.key, required this.onAddToCart});

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.phone_android, 'label': 'Elektronik'},
    {'icon': Icons.checkroom, 'label': 'Fashion'},
    {'icon': Icons.kitchen, 'label': 'Dapur'},
    {'icon': Icons.toys, 'label': 'Mainan'},
    {'icon': Icons.book, 'label': 'Buku'},
    {'icon': Icons.sports_basketball, 'label': 'Olahraga'},
    {'icon': Icons.local_grocery_store, 'label': 'Sembako'},
    {'icon': Icons.tv, 'label': 'TV & Audio'},
    {'icon': Icons.computer, 'label': 'Komputer'},
    {'icon': Icons.watch, 'label': 'Aksesoris'},
    {'icon': Icons.chair, 'label': 'Perabot'},
    {'icon': Icons.healing, 'label': 'Kesehatan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: Row(
          children: [
            const Text(
              'Shopee',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari di Shopee',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.white),
              onPressed: () {
                // fungsi pesan
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                // fungsi keranjang
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: PageView(
                children: [
                  bannerItem('assets/banner/banner1.webp'),
                  bannerItem('assets/banner/banner2.webp'),
                  bannerItem('assets/banner/banner3.webp'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orange.shade100,
                        child: Icon(category['icon'], color: Colors.orange),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category['label'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ProductDetailPage(
                              product: product,
                              onAddToCart: onAddToCart,
                            ),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
