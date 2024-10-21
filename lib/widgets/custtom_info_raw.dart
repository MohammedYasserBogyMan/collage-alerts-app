import 'package:flutter/material.dart';

class CustomInfoRow extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double fontSize;
  final Color iconColor;
  final Color textColor;
  final bool isTitle;
  final bool isDec;

  const CustomInfoRow(
      {super.key,
      this.icon,
      required this.text,
      required this.fontSize,
      required this.iconColor,
      required this.textColor,
      this.isTitle = false,
      this.isDec = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isTitle && !isDec) ...[
          Icon(
            icon,
            color: iconColor,
            size: 18,
          ),
          const SizedBox(width: 5),
        ],
        SizedBox(
          width: 320,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
              color: textColor,
              fontSize: fontSize,
              letterSpacing: 0.3,
              height: 1.4,
              decoration: TextDecoration.none,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
