import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Make sure to add this dependency
import 'inform.dart';
import 'profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BioScreen(),
  ));
}

class BioScreen extends StatefulWidget {
  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  String? fullNameError;
  String? mobileError;
  String? genderError;
  IconData genderIcon = Icons.person;

  void validateAndProceed() {
    setState(() {
      fullNameError = fullNameController.text.isEmpty ? "Full Name is required" : null;
      mobileError = mobileController.text.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(mobileController.text)
          ? "Valid Mobile Number is required" : null;
      genderError = genderController.text.isEmpty || !(genderController.text.toLowerCase() == 'male' || genderController.text.toLowerCase() == 'female')
          ? "Gender is required (Male/Female)" : null;
    });

    if (fullNameError == null && mobileError == null && genderError == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadPhotoScreen()),
      );
    }
  }

  void _updateGenderIcon(String value) {
    setState(() {
      if (value.toLowerCase() == 'female') {
        genderIcon = Icons.female;
      } else if (value.toLowerCase() == 'male') {
        genderIcon = Icons.male;
      } else {
        genderIcon = Icons.person;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "Fill in your bio to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This data will be displayed in your account profile for security",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            buildInputField(
              icon: Icons.person,

              label: "Full Name",
              controller: fullNameController,
              errorText: fullNameError,
            ),
            const SizedBox(height: 15),
            buildInputField(
              icon: Icons.phone,
              label: "Mobile Number",
              controller: mobileController,
              keyboardType: TextInputType.phone,
              errorText: mobileError,
            ),
            const SizedBox(height: 15),
            buildInputField(
              icon: genderIcon,
              label: "Gender (Male/Female)",
              controller: genderController,
              errorText: genderError,
              onChanged: (value) => _updateGenderIcon(value),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF8DB81),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                  ),
                  child: const Text("Next",
                      style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold, color: Color(0xFF880505))),
                ),
              ).animate().scale(duration: 300.ms), // Added animation
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildInputField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? errorText,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFFFADF90)),
            hintText: label,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: onChanged,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
