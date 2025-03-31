import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen_2.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen1 extends StatelessWidget {
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
              Color(0xFFF5CB62),
              Color(0xED700404),


            ],
          ),
        ),
        child: PageView(
          children: [

            Stack(
              children: [

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo (1).png',
                        height: 160,
                        width: 160,
                        fit: BoxFit.contain,
                      ).animate().fade(duration: 1200.ms).scale()
                    ],
                  ),
                ),


                Positioned(
                  left: -35,
                  bottom: -24,
                  child: Image.asset(
                    'images/42582fa650edcabf1a974599db150e87.png',
                    height: 250,
                    width: 250,
                  ).animate().slideX(begin: -1, duration: 1000.ms).fade(),
                ),
              ],
            ),

            OnboardingScreen2(),
          ],
        ),
      ),
    );
  }
}