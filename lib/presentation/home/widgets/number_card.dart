import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone_app/core/constants.dart';

class NumberCard extends StatelessWidget {
  NumberCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://media.themoviedb.org/t/p/w220_and_h330_face/spWV1eRzlDxvai8LbxwAWR0Vst4.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -35,
          left: 10,
          child: BorderedText(
            strokeWidth: 10,
            strokeColor: Colors.white,
            child: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 120, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
