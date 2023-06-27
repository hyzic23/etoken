import 'package:flutter/material.dart';

class ScaldFold extends StatelessWidget {
  final title;

  const ScaldFold({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
    );
  }
}
