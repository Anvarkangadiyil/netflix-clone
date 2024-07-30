import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 30,
    this.textSize = 18,
  });
  final IconData icon;
  final String label;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconSize,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
