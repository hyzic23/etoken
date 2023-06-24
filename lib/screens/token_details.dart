import 'package:flutter/material.dart';

class TokenDetails extends StatelessWidget {
  const TokenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Token Details',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const TokenDetailsWidget());
  }
}

class TokenDetailsWidget extends StatelessWidget {
  const TokenDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Serial Number:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text('FEA123456'),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Application Counter:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text('19'),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Client/Server Time Shift:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text('-1'),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'User ID:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text('6900581'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
