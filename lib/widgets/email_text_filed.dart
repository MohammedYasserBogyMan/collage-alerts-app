import 'package:flutter/material.dart';
import 'package:collage_allerts_app/const.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFieldWidget({required this.emailController, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: color2),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color4, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color4, width: 2.0),
        ),
      ),
      style: TextStyle(color: color5),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)) {
          return 'Email is not valid';
        }
        return null;
      },
    );
  }
}
