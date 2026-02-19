import 'package:flutter/material.dart';
import 'product_details_screen.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "Elegant Dress",
        "image": "images/coart1.jpeg",
        "category": "Dress",
        "price": "UGX 250,000",
      },
      {
        "name": "Custom Suit",
        "image": "images/coart2.jpeg",
        "category": "Suit",
        "price": "Custom Order",
      },
      {
        "name": "Ankara Style",
        "image": "images/coart4.jpeg",
        "category": "African Wear",
        "price": "UGX 180,000",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Our Collection"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
           onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ProductDetailsScreen(
        name: product["name"]!,
        image: product["image"]!,
        category: product["category"]!,
        price: product["price"]!,
      ),
    ),
  );
},

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            product["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),

                        // FAVORITE ICON
                        Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite_border,
                              color: Color(0xFFE91E63),
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // DETAILS
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product["category"]!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          product["price"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE91E63),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ORDER BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Later: order / customize
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE91E63),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Order",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
