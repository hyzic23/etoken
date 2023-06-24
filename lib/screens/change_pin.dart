import 'package:etoken/widgets/button_widget.dart';
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
  String oldPin = '';
  String newPin = '';
  String confirmNewPin = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildOldPin(),
          const SizedBox(height: 16),
          buildNewPin(),
          const SizedBox(height: 16),
          buildConfirmNewPin(),
          const SizedBox(height: 16),
          buildSubmit()
        ],
      ),
    );
  }

  Widget buildOldPin() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Old Pin',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 4,
        onSaved: (value) => setState(() {
          oldPin = value!;
        }),
      );

  Widget buildNewPin() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'New Pin',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 4,
        onSaved: (value) => setState(() {
          newPin = value!;
        }),
      );

  Widget buildConfirmNewPin() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Confirm New Pin',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.length < 4 || value.length > 5) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 4,
        onSaved: (value) => setState(() {
          confirmNewPin = value!;
        }),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Submit',
        onClicked: () {
          final isValid = formKey.currentState!.validate();

          if (isValid) {
            formKey.currentState!.save();

            final message =
                'OldPin: $oldPin\nNewPin: $newPin\nConfrimNewPin: $confirmNewPin';
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
