import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _contactController = TextEditingController(); // phone or email
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Creating account...")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Business Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/logo1.jpeg',
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Full Name
              TextFormField(
                controller: _nameController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.person, color: Colors.pinkAccent),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
              ),

              const SizedBox(height: 20),

              // Email or Phone
              TextFormField(
                controller: _contactController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  labelText: "Email or Phone Number",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon:
                      Icon(Icons.contact_mail, color: Colors.pinkAccent),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Please enter email or phone" : null,
              ),

              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: const TextStyle(fontSize: 14),
                  prefixIcon: const Icon(Icons.lock, color: Colors.pinkAccent),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) => value!.length < 6
                    ? "Password must be at least 6 characters"
                    : null,
              ),

              const SizedBox(height: 20),

              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: const TextStyle(fontSize: 14),
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.pinkAccent),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Please confirm your password";
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Sign Up button
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Link to Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(fontSize: 14)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
