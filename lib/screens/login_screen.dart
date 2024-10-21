// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:collage_allerts_app/widgets/custom_button.dart';
import 'package:collage_allerts_app/widgets/custtom_snackbar.dart';
import 'package:collage_allerts_app/widgets/email_text_filed.dart';
import 'package:collage_allerts_app/widgets/password_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:collage_allerts_app/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      SnackBarHelper.showCustomSnackBar(context, 'Successfully logged in.');

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
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/1.png'),
                Text('Welcome to Collage Alerts!', style: Hedingstyle2),
                const SizedBox(height: 15),
                EmailFieldWidget(emailController: _emailController),
                const SizedBox(height: 16),
                PasswordFieldWidget(passwordController: _passwordController),
                const SizedBox(height: 16),
                CusttomButtonWidget(
                  onPressed: _login,
                  text: 'Login',
                ),
                const SizedBox(height: 16),
                TextButtonWidgets(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  text: 'Don\'t have an account? Register',
                ),
                TextButtonWidgets(
                  onPressed: () {
                    Navigator.pushNamed(context, '/adminLogin');
                  },
                  text: 'I am a Admin ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
