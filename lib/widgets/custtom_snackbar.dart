import 'package:collage_allerts_app/const.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showCustomSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.blue}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: color3),
        ),
        backgroundColor: color4,
      ),
    );
  }
}
