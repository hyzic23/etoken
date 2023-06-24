import 'dart:math';
import 'package:flutter/material.dart';

class GenerateToken extends StatelessWidget {
  const GenerateToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Generate Token',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const GenerateTokenWidget());
  }
}

class GenerateTokenWidget extends StatefulWidget {
  const GenerateTokenWidget({super.key});

  @override
  State<GenerateTokenWidget> createState() => _GenerateTokenWidgetState();
}

class _GenerateTokenWidgetState extends State<GenerateTokenWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String token = '';

  String generateSixDigitsToken() {
    String generatedToken = Random().nextInt(999999).toString().padLeft(6, '0');
    token = generatedToken;
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              //child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //child: Container(
              // height: 50.0,
              // alignment: Alignment.center,
              //child: Center(
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  alignLabelWithHint: true,
                  labelText: token,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              //),
              //),
              //),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  String tokenGenerated = generateSixDigitsToken();
                  token = tokenGenerated;
                });
              },
              child: const Text('Generate OTP',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
