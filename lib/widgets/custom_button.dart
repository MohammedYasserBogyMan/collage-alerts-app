import 'package:collage_allerts_app/const.dart';
import 'package:flutter/material.dart';

class CusttomButtonWidget extends StatelessWidget {
  final Future<void> Function() onPressed;
  final String text;

  const CusttomButtonWidget({
    required this.onPressed,
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: color3,
          backgroundColor: color4,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class TextButtonWidgets extends StatelessWidget {
  const TextButtonWidgets(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(),
      child: Text(
        text,
        style: TextStyle(
          color: color5,
        ),
      ),
    );
  }
}
