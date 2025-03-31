// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _register() async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration successful!')),
//       );
//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Column(
//         children: [
//           TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
//           TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
//           ElevatedButton(onPressed: _register, child: Text("Register")),
//         ],
//       ),
//     );
//   }
// }
