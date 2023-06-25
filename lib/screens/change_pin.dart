import 'package:etoken/widgets/button_widget.dart';
import 'package:etoken/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title:
              const Text('Change Pin', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: const ChangePinWidget());
  }
}

class ChangePinWidget extends StatefulWidget {
  const ChangePinWidget({super.key});

  @override
  State<ChangePinWidget> createState() => _ChangePinWidgetState();
}

class _ChangePinWidgetState extends State<ChangePinWidget> {
  final formKey = GlobalKey<FormState>();
  final oldPin = TextEditingController();
  final newPin = TextEditingController();
  final confirmNewPin = TextEditingController();

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
              Container(height: 70, child: oldPinText()),
              const SizedBox(height: 16),
              Container(height: 70, child: newPinText()),
              const SizedBox(height: 16),
              Container(height: 70, child: confirmNewPinText()),
              const SizedBox(height: 16),
              SizedBox(height: 50, width: 400, child: buildSubmit()),
            ],
          ),
        ),
      ),
    );
  }

  Widget oldPinText() => TextFormFieldWidget(
        controller: oldPin,
        labelText: 'Old PIN',
        keyboardType: TextInputType.number,
        hintText: 'Old PIN',
        max: 4,
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter 4 characters';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          oldPin.text = value;
        }),
      );

  Widget newPinText() => TextFormFieldWidget(
        controller: newPin,
        labelText: 'New PIN',
        keyboardType: TextInputType.number,
        hintText: 'New PIN',
        max: 4,
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter 4 characters';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          newPin.text = value;
        }),
      );

  Widget confirmNewPinText() => TextFormFieldWidget(
        controller: confirmNewPin,
        labelText: 'Confirm New PIN',
        keyboardType: TextInputType.number,
        hintText: 'Confirm New PIN',
        max: 4,
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter 4 characters';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() {
          confirmNewPin.text = value;
        }),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Submit',
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            final message =
                'OldPin: ${oldPin.text} \nNewPin: ${newPin.text} \nConfrimNewPin: ${confirmNewPin.text}';
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
