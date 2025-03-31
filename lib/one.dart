// import 'package:flutter/material.dart';
// import 'onboarding_screen_2.dart'; // استيراد الشاشة الثانية
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: OnboardingScreen1(),
//   ));
// }
//
// class OnboardingScreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFCE9D3),
//       body: Stack(
//         children: [
//           // المحتوى الأساسي في المنتصف
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'images/logo (1).png',
//                   height: 160,
//                   width: 160,
//                   fit: BoxFit.contain,
//                 ),
//               ],
//             ),
//           ),
//
//           // زر الانتقال إلى الشاشة الثانية
//           Positioned(
//             bottom: 30,
//             left: 100,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => OnboardingScreen2()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.pink,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text('Next'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
