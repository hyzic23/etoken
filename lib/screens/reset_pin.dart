import 'package:etoken/commons/constant.dart';
import 'package:etoken/screens/generate_otp.dart';
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
          const Text(
            'Choose your reset method',
            style: TextStyle(fontSize: 18),
          ),
          //Image.asset('assets/token.webp'),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GenerateToken(),
                ));
              },
              child: Image.asset(
                'assets/token.png',
                fit: BoxFit.cover, // Fixes border issues
                width: 200.0,
                height: 200.0,
              ),
              // height: 300.0,
              // width: 300.0,
              // alignment: Alignment.center,
              // padding: const EdgeInsets.all(20),
              // decoration: const BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   image: DecorationImage(
              //       image: AssetImage('assets/token.png'), fit: BoxFit.fill),
              // ),
              //child: Text('Hardware Token'),
            ),
          ),
          //const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            splashColor: Colors.white10,
            child: Ink.image(
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                image: AssetImage('assets/card2.jpeg')),
          )
          // Container(
          //   height: 300.0,
          //   width: 400.0,
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.all(20),
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     image: DecorationImage(
          //         image: AssetImage('assets/card.jpeg'), fit: BoxFit.fill),
          //   ),

          //   //child: Text('Hardware Token'),
          // ),
        ],
      ),
    );
  }
}
