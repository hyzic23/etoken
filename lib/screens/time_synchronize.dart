import 'package:flutter/material.dart';

class TimeSynchronize extends StatelessWidget {
  const TimeSynchronize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text('Time Synchronization',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const TimeSynchronizeWidget());
  }
}

class TimeSynchronizeWidget extends StatefulWidget {
  const TimeSynchronizeWidget({super.key});

  @override
  State<TimeSynchronizeWidget> createState() => _TimeSynchronizeWidgetState();
}

class _TimeSynchronizeWidgetState extends State<TimeSynchronizeWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: const Text('Time Synchronization',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
