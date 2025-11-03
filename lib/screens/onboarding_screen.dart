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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFE4F1)], // white to soft pink
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              image: 'images/coart2.jpeg',
              title: 'Welcome to My App',
              description: 'Easily manage your tasks anywhere, anytime.',
            ),
            buildPage(
              image: 'images/coart1.jpeg',
              title: 'Stay Organized',
              description: 'Track your daily progress with smart reminders.',
            ),
            buildPage(
              image: 'images/coart2.jpeg',
              title: 'Achieve Your Goals',
              description: 'Turn your plans into action effortlessly.',
            ),
          ],
        ),
      ),

      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFE91E63), // pink button
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  TextButton(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFFE91E63),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => _controller.jumpToPage(2),
                  ),

                  // Page Indicator + Next Button
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const WormEffect(
                          activeDotColor: Color(0xFFE91E63),
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 40),
        Text(
          title,
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
            fontSize: 18,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
