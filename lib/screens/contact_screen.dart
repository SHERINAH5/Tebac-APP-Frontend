import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: const Color(0xFFE91E63),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "We’d love to hear from you!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Get in touch with us using the details below or send a quick message!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 30),

            // Contact Info with Icons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(Icons.email, color: Color(0xFFE91E63)),
                  title: Text("tebactailors@gmail.com"),
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Color(0xFFE91E63)),
                  title: Text("+256 770 381 164"),
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt, color: Color(0xFFE91E63)),
                  title: Text("@tebacdesigners (Instagram)"),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 1.2),
            const SizedBox(height: 20),

            // Contact Form
            const Text(
              "Send Us a Message",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE91E63),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),

            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: "Your Message",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 25),

            // Send Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent successfully!')),
                  );
                  nameController.clear();
                  emailController.clear();
                  messageController.clear();
                },
                icon: const Icon(Icons.send),
                label: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
