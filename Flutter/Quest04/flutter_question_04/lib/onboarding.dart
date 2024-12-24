import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title":
          "As of 2024, \n there are about 70,000 \n AI companies worldwide, \n with around 25% in the US.",
      "description": "",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title":
          "AI services are exploding daily. \n Missing them could set you back.",
      "description": "",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Stay ahead with NextSnap \n and catch every update.",
      "description": "",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                  image: onboardingData[index]["image"]!,
                );
              },
            ),
          ),
          _buildPageIndicator(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (_currentPage == onboardingData.length - 1) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          _currentPage == onboardingData.length - 1 ? "Get Started" : "Next",
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({super.key, 
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 250,
          ),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
