// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:collage_allerts_app/widgets/custom_button.dart';
import 'package:collage_allerts_app/widgets/custtom_snackbar.dart';
import 'package:collage_allerts_app/widgets/email_text_filed.dart';
import 'package:collage_allerts_app/widgets/password_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:collage_allerts_app/const.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      SnackBarHelper.showCustomSnackBar(context, 'Successfully registered.');

      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleTextStyle: Hedingstyle,
        backgroundColor: color3,
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/2.png'),
                Text('Create a New Account!', style: Hedingstyle2),
                const SizedBox(height: 15),
                EmailFieldWidget(emailController: _emailController),
                const SizedBox(height: 16),
                PasswordFieldWidget(passwordController: _passwordController),
                const SizedBox(height: 16),
                CusttomButtonWidget(
                  onPressed: _register,
                  text: 'Register',
                ),
                TextButtonWidgets(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Already have an account? Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
