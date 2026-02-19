import 'package:flutter/material.dart';
import 'custom_order_screen.dart';


class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final String category;
  final String price;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PRODUCT IMAGE
            Image.asset(
              image,
              width: double.infinity,
              height: 320,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAME
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // CATEGORY
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // PRICE
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This design is crafted with precision and elegance, "
                    "tailored to bring out confidence and style. "
                    "Perfect for special occasions, formal events, "
                    "or custom personal fashion statements.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // FABRIC / SIZE INFO
                  infoRow("Fabric", "Premium Cotton / Silk"),
                  infoRow("Available Sizes", "Custom Fit"),
                  infoRow("Delivery", "5–7 Working Days"),

                  const SizedBox(height: 40),

                  // ORDER BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => CustomOrderScreen(
        productName: name,
      ),
    ),
  );
},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Order / Customize",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
