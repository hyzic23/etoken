import 'dart:async';
import 'dart:math';
import 'package:etoken/main.dart';
import 'package:flutter/material.dart';

class GenerateToken extends StatelessWidget {
  const GenerateToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
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
  final tokenController = TextEditingController();
  late Timer _timer;
  Timer? countdownTimer;
  int _secondsRemaining = 60; // Set the initial countdown duration in seconds

  bool isVisible = false;

  String generateSixDigitsToken() {
    String generatedToken = Random().nextInt(999999).toString().padLeft(6, '0');
    token = generatedToken;
    return token;
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_secondsRemaining < 1) {
            timer.cancel();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyApp())); // Cancel the timer when the countdown is completed
          } else {
            _secondsRemaining -= 1;
          }
        });
      },
    );
  }

  // @override
  // void dispose() {
  //   counterController.dispose();
  //   super.dispose();
  // }

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
              child: TextFormField(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                controller: tokenController,
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  isVisible = !false;
                  String tokenGenerated = generateSixDigitsToken();
                  tokenController.text = tokenGenerated;
                });
              },
              child: const Text('Generate OTP',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 5),
            Center(
              child: isVisible
                  ? Text(
                      '$_secondsRemaining seconds remaining',
                      style: const TextStyle(fontSize: 25.0),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
