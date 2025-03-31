import 'package:flutter/material.dart';
import 'onboarding_screen_3.dart'; // استيراد الشاشة الثالثة
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xED700404),
              Color(0xFFF5CB62), // لون فاتح مدمج
              Color(0xED700404), // لون غامق
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // صورة الخلفية
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/Illustration.png',
                width: 300,
                height: 300,
              ).animate().slideY(begin: -1, duration: 1000.ms).fade(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Track your Comfort Food here",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fade(duration: 1200.ms).scale(),
                SizedBox(height: 20),
                Image.asset(
                  'images/ab-removebg-preview 1.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ).animate().slideX(begin: -1, duration: 1000.ms).fade(),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Here You Can find a chef or dish for every taste and color. Enjoy!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ).animate().fade(duration: 1200.ms),
                SizedBox(height: 100),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingScreen3()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFCC957),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.bold,
                          color: Color(0xFF7A0404),
                        ),
                      ),
                    ),
                  ).animate().fade(duration: 800.ms).scale(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
