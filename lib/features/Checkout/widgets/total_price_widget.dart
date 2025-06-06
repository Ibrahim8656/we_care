
import 'package:flutter/material.dart';
import 'package:we_care/core/utils/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          "$value",
          textAlign: TextAlign.center,
          style: Styles.style24,
        )
      ],
    );
  }
}