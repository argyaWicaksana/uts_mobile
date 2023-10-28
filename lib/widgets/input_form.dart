import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'First Name',
        icon: Icon(Icons.account_box),
      ),
    );
  }
}
