
import 'package:flutter/material.dart';
import 'package:we_care/core/utils/app_styles.dart';

class custom_bottom extends StatelessWidget {
  const custom_bottom({
    super.key, required this.color, required this.text, this.fontSize,
  });
  final Color color;
  final String text;
  final double? fontSize;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
        child: Text(
         text,
          style: AppStyles.stylesmall.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: fontSize !=null?fontSize :25
          ),
        ),
      ),
    );
  }
}
