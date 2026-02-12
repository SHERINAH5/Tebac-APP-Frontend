import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white, // ✅ Clean white background
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // Illustration 
              Center(
                child: Image.asset(
                  'images/icon1.jpeg', 
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter your email address below and we’ll send you a link to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 30),

              // Email Input
              TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.email, color: Colors.pinkAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Send Reset Link Button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password reset link sent!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Back to Login link
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
