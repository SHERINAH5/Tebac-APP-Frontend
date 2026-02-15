import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'recommendation_screen.dart';
import 'contact_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const primaryColor = Color(0xFFE91E63);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 🔝 APP BAR
      appBar: AppBar(
        title: const Text(
          'TEBAC Designers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
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

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔥 HERO BANNER
              _heroBanner(),

              const SizedBox(height: 25),

              /// ⚡ QUICK ACTIONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAction(Icons.checkroom, "Shop"),
                  _quickAction(Icons.design_services, "Custom"),
                  _quickAction(Icons.favorite, "For You"),
                  _quickAction(Icons.support_agent, "Support"),
                ],
              ),

              const SizedBox(height: 30),

              /// 🧠 RECOMMENDATIONS
              _sectionTitle("Recommended for You"),
              const SizedBox(height: 10),
              _horizontalProducts([
                "Slim Fit Suit",
                "African Wear",
                "Wedding Dress",
                "Classic Shirt",
              ]),

              const SizedBox(height: 30),

              /// 🆕 NEW ARRIVALS
              _sectionTitle("New Arrivals"),
              const SizedBox(height: 10),
              _horizontalProducts([
                "Office Blazer",
                "Luxury Gown",
                "Casual Shirt",
                "Ankara Set",
              ]),

              const SizedBox(height: 30),

              /// 📦 CATEGORIES
              _sectionTitle("Categories"),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _categoryCard("Suits", Icons.checkroom),
                  _categoryCard("Dresses", Icons.shopping_bag),
                  _categoryCard("Casual Wear", Icons.style),
                  _categoryCard("Custom Wear", Icons.design_services),
                ],
              ),

              const SizedBox(height: 30),

              /// ✂️ CUSTOM DESIGN CTA
              _customDesignCTA(),

              const SizedBox(height: 30),

              /// ⭐ TRUST STATS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _brandStat("500+", "Happy Clients"),
                  _brandStat("1200+", "Designs Made"),
                  _brandStat("5★", "Rating"),
                ],
              ),

              const SizedBox(height: 40),

              /// 🔗 NAVIGATION BUTTONS
              _mainButton(
                context,
                icon: Icons.style,
                label: "View Collection",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProductsScreen()),
                  );
                },
              ),
              const SizedBox(height: 15),

              _mainButton(
                context,
                icon: Icons.recommend,
                label: "AI Recommendations",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RecommendationScreen()),
                  );
                },
              ),
              const SizedBox(height: 15),

              _mainButton(
                context,
                icon: Icons.contact_phone,
                label: "Contact Us",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactScreen()),
                  );
                },
              ),

              const SizedBox(height: 30),

              /// ❤️ FOOTER
              const Center(
                child: Text(
                  "Designed with ❤️ by TEBAC Designers",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ===================== WIDGETS =====================

  Widget _heroBanner() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('images/featured.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Tailored Elegance\nMade Just for You",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  Widget _horizontalProducts(List<String> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) => _productCard(item)).toList(),
      ),
    );
  }

  Widget _productCard(String name) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 3),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, size: 36, color: primaryColor),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(String name, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: primaryColor),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _customDesignCTA() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4EC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Get a Custom Design",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Choose fabric, style & measurements.\nWe design it for you.",
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: const Text("Start Custom Order"),
          ),
        ],
      ),
    );
  }

  static Widget _brandStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: const Color(0xFFFFE4EC),
          child: Icon(icon, color: primaryColor),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _mainButton(BuildContext context,
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
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
