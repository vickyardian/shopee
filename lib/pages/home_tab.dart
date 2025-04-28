import 'package:flutter/material.dart';
import '../data/product_list.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class HomeTab extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;
  const HomeTab({super.key, required this.onAddToCart});

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
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
