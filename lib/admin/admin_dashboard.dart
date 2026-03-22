import 'package:flutter/material.dart';
import 'admin_orders_screen.dart';
import 'admin_products_screen.dart';
import '../../screens/main_navigation.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'customer') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainNavigation(),
                  ),
                );
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'customer',
                child: Text('View as Customer'),
              ),
            ],
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  /// Switch dashboard pages internally
  Widget _buildBody() {
    switch (_currentPage) {
      case 1:
        return const AdminOrdersScreen();
      case 2:
        return const AdminProductsScreen();
      default:
        return _overviewPage();
    }
  }

  /// DASHBOARD OVERVIEW PAGE
  Widget _overviewPage() {
    return Padding(
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
            "Manage Orders",
            Icons.shopping_cart,
            () => setState(() => _currentPage = 1),
          ),

          const SizedBox(height: 10),

          actionButton(
            "Manage Products",
            Icons.design_services,
            () => setState(() => _currentPage = 2),
          ),
        ],
      ),
    );
  }

  /// DASHBOARD CARD
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

  /// ACTION BUTTON
  Widget actionButton(
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