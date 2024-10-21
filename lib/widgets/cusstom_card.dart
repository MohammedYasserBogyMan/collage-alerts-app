import 'package:collage_allerts_app/const.dart';
import 'package:collage_allerts_app/widgets/custtom_info_raw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CusstomCard extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CusstomCard({
    super.key,
    required this.alert,
  });

  final Map<String, dynamic> alert;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/alertDetail', arguments: alert);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInfoRow(
                  isTitle: true,
                  icon: Icons.title,
                  text: alert['title'],
                  fontSize: 24,
                  iconColor: color3,
                  textColor: color3,
                ),
                const SizedBox(height: 4),
                CustomInfoRow(
                  isDec: true,
                  icon: Icons.description_outlined,
                  text: alert['description'],
                  fontSize: 20,
                  iconColor: color3,
                  textColor: color3,
                ),
                const SizedBox(height: 10),
                CustomInfoRow(
                  icon: Icons.calendar_today,
                  text: DateFormat('yyyy-MM-dd').format(alert['date']),
                  fontSize: 14,
                  iconColor: color3,
                  textColor: color3,
                ),
                const SizedBox(height: 8),
                CustomInfoRow(
                  icon: Icons.access_time,
                  text: DateFormat('HH:mm').format(alert['date']),
                  fontSize: 14,
                  iconColor: color3,
                  textColor: color3,
                ),
                const SizedBox(height: 8),
                CustomInfoRow(
                  icon: Icons.person,
                  text: alert['createdBy'],
                  fontSize: 14,
                  iconColor: color3,
                  textColor: color3,
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: color3,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
