import 'package:flutter/material.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Products'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          'Manage products here',
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          // TODO: Add product logic
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}