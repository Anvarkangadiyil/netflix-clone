import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cast, color: Colors.white),
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kwidth
      ],
    );
  }
}
