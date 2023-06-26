import 'package:etoken/commons/constant.dart';
import 'package:etoken/screens/change_pin.dart';
import 'package:etoken/screens/generate_otp.dart';
import 'package:etoken/screens/reset_pin.dart';
import 'package:etoken/screens/time_synchronize.dart';
import 'package:etoken/screens/token_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zenith eToken',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //transformAlignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/zenith-bank-bg.jpeg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: Image.asset(
                'assets/zenith-bank-logo_1.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
            const SizedBox(height: 300.0),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: ElevatedButton.icon(
                label: const Align(
                  child: Text('Generate OTP',
                      style: TextStyle(color: Constant.textColorWhite)),
                ),
                icon: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.loop,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.buttonColorRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GenerateToken(),
                  ));
                },
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: ElevatedButton.icon(
                label: const Align(
                  //alignment: Alignment.centerLeft,
                  child: Text('Token Details',
                      style: TextStyle(color: Constant.textColorWhite)),
                ),
                icon: const Icon(
                  Icons.event_note,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.buttonColorRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TokenDetails()));
                },
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: ElevatedButton.icon(
                label: const Align(
                  child: Text('Time Synchronization',
                      style: TextStyle(color: Constant.textColorWhite)),
                ),
                icon: const Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.buttonColorRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TimeSynchronize()));
                },
              ),
            ),
            const SizedBox(height: 4.0),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: ElevatedButton.icon(
                label: const Align(
                  //alignment: Alignment.centerLeft,
                  child: Text('Reset Pin',
                      style: TextStyle(color: Constant.textColorWhite)),
                ),
                icon: const Icon(
                  Icons.lock_open_rounded,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.buttonColorRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResetPin()));
                },
              ),
            ),
            const SizedBox(height: 4.0),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              child: ElevatedButton.icon(
                label: const Align(
                  //alignment: Alignment.centerLeft,
                  child: Text('Change Pin',
                      style: TextStyle(color: Constant.textColorWhite)),
                ),
                icon: const Icon(
                  Icons.pin,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.buttonColorRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangePin()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
