import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensure white background for all screens
      body: SafeArea(
        child: Stack(
          children: [
            // PageView content
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2);
              },
              children: [
                buildPage(
                  image: 'images/coart2.jpeg',
                  title: 'Welcome to My App',
                  description:
                      'Easily manage your tasks anywhere, anytime with smart organization tools.',
                ),
                buildPage(
                  image: 'images/coart4.jpeg',
                  title: 'Stay Organized',
                  description:
                      'Track progress, stay focused, and boost productivity with daily goals.',
                ),
                buildPage(
                  image: 'images/coart1.jpeg',
                  title: 'Achieve Your Goals',
                  description:
                      'Turn your plans into action and make every day meaningful.',
                ),
              ],
            ),

            // Bottom navigation
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: isLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE91E63),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          elevation: 3,
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => _controller.jumpToPage(2),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Color(0xFFE91E63),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                  activeDotColor: Color(0xFFE91E63),
                                  dotColor: Colors.grey,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  expansionFactor: 3,
                                  spacing: 5,
                                ),
                              ),
                              const SizedBox(width: 15),
                              FloatingActionButton(
                                backgroundColor: const Color(0xFFE91E63),
                                onPressed: () => _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(image, height: 320, fit: BoxFit.cover),
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[800],
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
