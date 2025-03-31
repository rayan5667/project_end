import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InformScreen(),
  ));
}

class InformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inform Screen")),
      body: Center(child: Text("This is the Inform Screen!")),
    );
  }
}
