import 'package:flutter/material.dart';
import 'order_details_screen.dart';


class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  final List<Map<String, String>> orders = [
    {
      "product": "Elegant Dress",
      "status": "Pending",
      "date": "12 Feb 2026",
    },
    {
      "product": "Custom Suit",
      "status": "In Progress",
      "date": "10 Feb 2026",
    },
    {
      "product": "Ankara Style",
      "status": "Ready",
      "date": "5 Feb 2026",
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case "Ready":
        return Colors.green;
      case "In Progress":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: orders.isEmpty
          ? const Center(child: Text("No orders yet"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag,
                        color: Color(0xFFE91E63)),
                    title: Text(
                      order["product"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(order["date"]!),
                    trailing: Text(
                      order["status"]!,
                      style: TextStyle(
                        color: _statusColor(order["status"]!),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Viewing order: ${order["product"]}"),
                        ),
                      );
                       Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => OrderDetailsScreen(order: order),
    ),
  );
                    },
                  ),
                );
              },
            ),
    );
  }
}