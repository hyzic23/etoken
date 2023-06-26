import 'package:etoken/commons/constant.dart';
import 'package:etoken/screens/generate_otp.dart';
import 'package:etoken/screens/reset_pin_token.dart';
import 'package:flutter/material.dart';

class ResetPin extends StatelessWidget {
  const ResetPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Pin', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Constant.buttonColorRed,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const ResetPinWidget(),
    );
  }
}

class ResetPinWidget extends StatelessWidget {
  const ResetPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Choose your reset method',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ResetPinTokenScreen(),
                ));
              },
              child: Image.asset(
                'assets/token.png',
                fit: BoxFit.cover, // Fixes border issues
                width: 200.0,
                height: 200.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GenerateToken(),
              ));
            },
            splashColor: Colors.white10,
            child: Ink.image(
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                image: const AssetImage('assets/card.jpg')),
          )
        ],
      ),
    );
  }
}
