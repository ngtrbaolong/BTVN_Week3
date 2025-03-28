import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHelloScreen() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HelloScreen()),
  );

  Widget _buildPageIndicator(int index) => Container(
    width: 10,
    height: 10,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Row(children: List.generate(3, _buildPageIndicator)),
                  const Spacer(),
                  TextButton(
                    onPressed: _navigateToHelloScreen,
                    child: const Text(
                      'skip',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: const [
                  OnboardingPage1(),
                  OnboardingPage2(),
                  OnboardingPage3(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              _currentPage == 0
                  ? _buildFullWidthButton('Next', () {
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              })
                  : Row(
                children: [
                  _buildCircleButton(Icons.arrow_back, () {
                    _pageController.animateToPage(
                      _currentPage - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildFullWidthButton(
                      _currentPage == 2 ? 'Get Started' : 'Next',
                          () {
                        if (_currentPage == 2) {
                          _navigateToHelloScreen();
                        } else {
                          _pageController.animateToPage(
                            _currentPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) => Container(
    width: 56,
    height: 56,
    decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
    child: IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPressed,
    ),
  );

  Widget _buildFullWidthButton(String text, VoidCallback onPressed) => SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) => _buildOnboardingPage(
    'assets/a1.svg',
    'Easy Time Management',
    'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    isSvg: true,
  );
}

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) => _buildOnboardingPage(
    'assets/a2.png',
    'Increase Work Effectiveness',
    'Time management and the determination of more important tasks will give your job statistics better and always improve',
  );
}

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) => _buildOnboardingPage(
    'assets/a3.jpg',
    'Reminder Notification',
    'The advantage of this application is that it also provides reminders for you so you don\'t forget to keep doing your assignments well and according to the time you have set',
  );
}

Widget _buildOnboardingPage(
    String imagePath,
    String title,
    String description, {
      bool isSvg = false,
    }) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      isSvg
          ? SvgPicture.asset(imagePath, height: 280)
          : Image.asset(imagePath, height: 280),
      const SizedBox(height: 40),
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
      ),
    ],
  ),
);

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'UTH SmartTasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed:
              () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Screen1()),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome to UTH SmartTasks!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}