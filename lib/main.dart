import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'inform.dart';
import 'onboarding_screen_1.dart';
import 'login.dart';
import 'signup.dart';
import 'bio_screen.dart';
import 'profile.dart'; // استيراد UploadPhotoScreen
import 'home_screen.dart'; // استيراد MainScreen و CartProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(), // CartProvider من home_screen.dart
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen1(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/main_screen': (context) => const MainScreen(), // إضافة مسار لـ MainScreen
      },
    );
  }
}