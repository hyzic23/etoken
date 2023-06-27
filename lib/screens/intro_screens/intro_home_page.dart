import 'package:flutter/material.dart';

class IntroHomePage extends StatelessWidget {
  const IntroHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Home Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Text('Welcome to Introduction Home Page'),
    );
  }
}
