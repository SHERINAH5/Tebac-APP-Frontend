import 'package:flutter/material.dart';
import 'admin_orders_screen.dart';
import 'admin_products_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overview",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                dashboardCard("Orders", "120", Icons.shopping_bag),
                const SizedBox(width: 12),
                dashboardCard("Products", "35", Icons.checkroom),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                dashboardCard("Pending", "18", Icons.pending),
                const SizedBox(width: 12),
                dashboardCard("Completed", "102", Icons.check_circle),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            actionButton(
              context,
              "Manage Orders",
              Icons.shopping_cart,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AdminOrdersScreen(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            actionButton(
              context,
              "Manage Products",
              Icons.design_services,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AdminProductsScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0F5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFFE91E63), size: 28),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget actionButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE91E63),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}