import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login.dart'; // استيراد صفحة تسجيل الدخول
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen3 extends StatelessWidget {
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
                  "Feastly is Where Your Comfort Food Resides",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fade(duration: 1200.ms).scale(),
                SizedBox(height: 20),
                Image.asset(
                  'images/ezgif 1.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ).animate().slideX(begin: -1, duration: 1000.ms).fade(),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Enjoy a fast and smooth food delivery at your doorstep",
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SplashScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Color(0xFFFCC957),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF790303),
                          fontWeight:FontWeight.bold
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
