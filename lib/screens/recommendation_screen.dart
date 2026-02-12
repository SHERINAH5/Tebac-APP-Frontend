import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recommendations = [
      {"name": "Summer Gown", "image": "images/coart4.jpeg"},
      {"name": "African Print Jacket", "image": "images/coart1.jpeg"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Recommended for You"),
        backgroundColor: Color(0xFFE91E63),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(12)),
                  child: Image.asset(
                    recommendations[index]["image"]!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    recommendations[index]["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
