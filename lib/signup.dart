import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:email_validator/email_validator.dart';

import 'inform.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  late Box _userBox;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  void _openHiveBox() async {
    _userBox = await Hive.openBox('userBox'); // تأكد من استخدام نفس اسم الصندوق
    setState(() {});
  }

  bool _isEmailUnique(String email) => !_userBox.containsKey(email);

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      if (_isEmailUnique(email)) {
        _userBox.put(email, {
          'name': _nameController.text,
          'password': _passwordController.text
        });

        // ✅ عرض رسالة نجاح التسجيل
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );

        // ✅ الانتقال إلى صفحة BioScreen بعد نجاح التسجيل
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BioScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email is already registered!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // لمنع تغيير الحجم عند ظهور الكيبورد
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFF6E0303),  Color(0xFF8C0303)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset(
              'images/logo (2).png',
              width: 200,
              height: 200,
            ),
            Text(
              "Deliver Favourite Food",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildTextField("Name", _nameController, (value) {
                        if (value!.length < 3 ||
                            RegExp(r'[0-9@!#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Name must be at least 3 characters long and contain no symbols or numbers.';
                        }
                        return null;
                      }, icon: Icons.person),
                      SizedBox(height: 15),
                      _buildTextField("Email", _emailController, (value) {
                        if (!EmailValidator.validate(value!)) {
                          return 'Enter a valid email address.';
                        }
                        return null;
                      }, icon: Icons.email),
                      SizedBox(height: 15),
                      _buildPasswordField(),
                      SizedBox(height: 25),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Color(0xFFF5C967),
                        ),
                        onPressed: _register,
                        child: Text("Create Account",
                            style: TextStyle(
                                color: Color(0xFF880505),fontWeight: FontWeight.bold,fontSize: 18)),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text("Already have an account? Login",
                            style: TextStyle(color: Color(0xE25B5959))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      FormFieldValidator<String> validator,
      {required IconData icon}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFFF6DCA6)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock, color: Color(0xFFF6DCA6)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFFEEB440),
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.length < 8 ||
            !RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#\$%^&+=])').hasMatch(value)) {
          return 'Password must be at least 8 characters, contain an uppercase, a lowercase, a number, and a special character.';
        }
        return null;
      },
    );
  }
}
