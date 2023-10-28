import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobileNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter some text';
                      }
                      if (value.length <= 3) {
                        return 'Must be more than 3 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      icon: Icon(Icons.account_box),
                    ),
                    controller: firstName,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      icon: Icon(Icons.account_box),
                    ),
                    controller: lastName,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your number';
                      }
                      if (value.length != 10) {
                        return 'Must be of 10 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      icon: Icon(Icons.phone),
                    ),
                    controller: mobileNumber,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.alternate_email),
                    ),
                    controller: email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your password';
                      }
                      if (value.length < 5) {
                        return 'Must be more than 5 characters length';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    controller: password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != password.text) {
                        return 'Must be equals with password';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password', icon: Icon(Icons.lock)),
                  ),
                  TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      icon: Icon(Icons.home_filled),
                    ),
                    controller: address,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Your Data'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('First Name: ${firstName.text}'),
                                Text('Last Name: ${lastName.text}'),
                                Text('Mobile Number: ${mobileNumber.text}'),
                                Text('Email: ${email.text}'),
                                Text('Password: ${password.text}'),
                                Text('Address: ${address.text}'),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
