import 'package:etoken/widgets/button_widget.dart';
import 'package:etoken/widgets/text_form_field_password_widget.dart';
import 'package:etoken/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ResetPinCardScreen extends StatefulWidget {
  const ResetPinCardScreen({super.key});

  @override
  State<ResetPinCardScreen> createState() => _ResetPinCardScreenState();
}

class _ResetPinCardScreenState extends State<ResetPinCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text('Reset Pin - Card',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const ResetPinCardWidget());
  }
}

class ResetPinCardWidget extends StatefulWidget {
  const ResetPinCardWidget({super.key});

  @override
  State<ResetPinCardWidget> createState() => _ResetPinCardWidgetState();
}

class _ResetPinCardWidgetState extends State<ResetPinCardWidget> {
  final formKey = GlobalKey<FormState>();

  final accountNumber = TextEditingController();
  final last6Digits = TextEditingController();
  final cardPin = TextEditingController();

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
              Container(height: 70, child: const Text('Reset Pin - Card')),
              const SizedBox(height: 16),
              Container(height: 70, child: accountNumberText()),
              const SizedBox(height: 16),
              Container(height: 70, child: last6DigitsText()),
              const SizedBox(height: 16),
              Container(height: 70, child: cardPinText()),
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

  Widget last6DigitsText() => TextFormFieldPasswordWidget(
        controller: last6Digits,
        labelText: 'Last 6-digits',
        keyboardType: TextInputType.number,
        hintText: 'Last 6-digits',
        max: 6,
        validator: (value) {
          if (value == null || value.length < 6 || value.length > 6) {
            return 'Enter 6 numbers';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          last6Digits.text = value;
        }),
      );

  Widget cardPinText() => TextFormFieldPasswordWidget(
        controller: cardPin,
        labelText: 'Card Pin',
        keyboardType: TextInputType.number,
        hintText: 'Card Pin',
        max: 4,
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 4) {
            return 'Enter 4 numbers';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          cardPin.text = value;
        }),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Submit',
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            final message =
                'Account Number: ${accountNumber.text} \nPinAndToken: ${last6Digits.text} \nCardPin: ${cardPin.text}  ';
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
