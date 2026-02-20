import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, String> order;

  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoTile("Product", order["product"]!),
            _infoTile("Status", order["status"]!),
            _infoTile("Order Date", order["date"]!),

            const SizedBox(height: 25),

            const Text(
              "Order Timeline",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            const SizedBox(height: 15),

            _timelineStep("Order Placed", true),
            _timelineStep("Tailoring In Progress",
                order["status"] != "Pending"),
            _timelineStep("Ready for Pickup",
                order["status"] == "Ready"),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _timelineStep(String title, bool completed) {
    return Row(
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }
}