// import 'package:flutter/material.dart';
// import 'login.dart'; // استيراد صفحة تسجيل الدخول
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: OnboardingScreen3(),
//   ));
// }
//
// class OnboardingScreen3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF), // لون الخلفية الأساسي
//       body: Stack(
//         alignment: Alignment.center, // جعل كل العناصر في المنتصف
//         children: [
//           // صورة الخلفية
//           Positioned(
//             top: 130, // ضبط موضع الصورة
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'images/Illustration.png',
//               width: 300, // جعلها تأخذ 80% من عرض الشاشة
//               height: 300,
//             ),
//           ),
//           // محتوى الصفحة
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // النص الرئيسي
//               Text(
//                 "Foodie is Where Your Comfort Food Resides",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               // الصورة
//               Image.asset(
//                 'images/ezgif 1.png',
//                 height: 250,
//                 width: 250,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(height: 40),
//               // النص الثانوي
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Enjoy a fast and smooth food delivery at your doorstep",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 100),
//               // زر Next
//               Center(
//                 child: SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // الانتقال إلى صفحة تسجيل الدخول عند الضغط على Next
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       "Next",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
