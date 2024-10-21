import 'package:flutter/material.dart';
import 'package:collage_allerts_app/const.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordFieldWidget({required this.passwordController, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: color2),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color4, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color4, width: 2.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: color2,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      style: TextStyle(color: color5),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
