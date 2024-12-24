import 'package:flutter/material.dart';
import 'Onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            );
          }
        },
        child: Center(
          child: Container(
            width: 383,
            height: 812,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://framerusercontent.com/images/sEnv2wKWQlCuEUcFyeZMcyNg.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: SizedBox(
                    width: 383,
                    height: 91,
                    child: Text(
                      'Next.Snap',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 2.33,
                        letterSpacing: -1.00,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
                SizedBox(
                  width: 383,
                  height: 91,
                  child: Text(
                    '"Catch the Next Trend in a Snap"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
