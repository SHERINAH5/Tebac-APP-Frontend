import 'package:flutter/material.dart';

class AdminCustomersScreen extends StatelessWidget {
  const AdminCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> customers = [
      {
        "name": "Sherinah",
        "phone": "0770381164",
        "email": "arindasherinah1@gmail.com",
        "address": "Kampala"
      },
      {
        "name": "Jane",
        "phone": "0700000000",
        "email": "jane@email.com",
        "address": "Entebbe"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE91E63),
        child: const Icon(Icons.add),
        onPressed: () {
          // later open add customer form
        },
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(customer["name"]!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone: ${customer["phone"]}"),
                  Text("Email: ${customer["email"]}"),
                  Text("Address: ${customer["address"]}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
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