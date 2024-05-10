import 'package:flutter/material.dart';
import 'package:netflix_clone_app/domain/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: 30,
        ),
        Text(label),
      ],
    );
  }
}
