import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'recommendation_screen.dart';
import 'contact_screen.dart';
import 'profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'TEBAC Designers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE91E63),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
        icon: const Icon(Icons.person),
      onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  },
),


        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Business logo
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFE91E63), width: 3),
                  image: const DecorationImage(
                    image: AssetImage('images/logo1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Welcome text
              const Text(
                'Welcome to TEBAC Designers!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Text(
                'Discover elegant fashion designs, custom suits,\n'
                'and personalized recommendations tailored just for you.',
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              /// 🔥 RECOMMENDED FOR YOU SECTION (Smart Look!)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended for You",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE91E63),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Horizontal scroll recommendation view
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    recommendationCard("Slim Fit Suit"),
                    recommendationCard("African Wear"),
                    recommendationCard("Wedding Dress"),
                    recommendationCard("Classic Shirt"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Categories Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE91E63),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  categoryCard("Suits", Icons.checkroom),
                  categoryCard("Dresses", Icons.shopping_bag),
                  categoryCard("T-shirts", Icons.checkroom),
                  categoryCard("Custom Wear", Icons.design_services),
                ],
              ),
              const SizedBox(height: 30),

              // Navigation Buttons
              buildButton(
                context,
                icon: Icons.style,
                label: 'View Collection',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProductsScreen()));
                },
              ),
              const SizedBox(height: 15),

              buildButton(
                context,
                icon: Icons.recommend,
                label: 'Recommended for You',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const RecommendationScreen()));
                },
              ),
              const SizedBox(height: 15),

              buildButton(
                context,
                icon: Icons.contact_phone,
                label: 'Contact Us',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ContactScreen()));
                },
              ),
              const SizedBox(height: 40),

              // Footer text
              const Text(
                'Designed with ❤️ by TEBAC Designers',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable button
  Widget buildButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(label,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE91E63),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}

/// 🔥 Outside the class: Category Card
Widget categoryCard(String name, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Color(0xFFE91E63)),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          spreadRadius: 1,
          offset: Offset(0, 3),
          color: Colors.black12,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Color(0xFFE91E63)),
        const SizedBox(height: 8),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

/// 🧠 Now your App Looks Smart — Recommendation Card
Widget recommendationCard(String productName) {
  return Container(
    width: 150,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Color(0xFFE91E63)),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          spreadRadius: 1,
          offset: Offset(0, 2),
          color: Colors.black12,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.favorite, size: 35, color: Color(0xFFE91E63)),
        const SizedBox(height: 8),
        Text(productName,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ],
    ),
  );
}
