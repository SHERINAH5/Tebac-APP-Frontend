import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Orders'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          'All customer orders will appear here',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}