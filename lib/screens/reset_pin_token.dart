import 'package:etoken/widgets/button_widget.dart';
import 'package:etoken/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ResetPinTokenScreen extends StatefulWidget {
  const ResetPinTokenScreen({super.key});

  @override
  State<ResetPinTokenScreen> createState() => _ResetPinTokenScreenState();
}

class _ResetPinTokenScreenState extends State<ResetPinTokenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text('Reset Pin - Hardeware Token',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const ResetPinTokenWidget());
  }
}

class ResetPinTokenWidget extends StatefulWidget {
  const ResetPinTokenWidget({super.key});

  @override
  State<ResetPinTokenWidget> createState() => _ResetPinTokenWidgetState();
}

class _ResetPinTokenWidgetState extends State<ResetPinTokenWidget> {
  final formKey = GlobalKey<FormState>();

  final accountNumber = TextEditingController();

  final pinToken = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 70, child: const Text('Reset Pin - Hardware Token')),
              const SizedBox(height: 16),
              Container(height: 70, child: accountNumberText()),
              const SizedBox(height: 16),
              Container(height: 70, child: pinTokenText()),
              const SizedBox(height: 16),
              SizedBox(height: 50, width: 400, child: buildSubmit()),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountNumberText() => TextFormFieldWidget(
        controller: accountNumber,
        labelText: 'Account Number',
        keyboardType: TextInputType.number,
        hintText: 'Account Number',
        max: 10,
        validator: (value) {
          if (value == null || value.length < 10 || value.length > 11) {
            return 'Enter 10 numbers';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          accountNumber.text = value;
        }),
      );

  Widget pinTokenText() => TextFormFieldWidget(
        controller: pinToken,
        labelText: 'Old PIN',
        keyboardType: TextInputType.number,
        hintText: 'Old PIN',
        max: 6,
        validator: (value) {
          if (value == null || value.length < 6 || value.length > 6) {
            return 'Enter 6 numbers';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          pinToken.text = value;
        }),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Submit',
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            final message =
                'Account Number: ${accountNumber.text} \nPinAndToken: ${pinToken.text} ';
            final snackBar = SnackBar(
              content: Text(
                message,
                style: const TextStyle(fontSize: 20),
              ),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      );
}
