import 'package:flutter/material.dart';
import 'package:netflix_clone_app/domain/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
