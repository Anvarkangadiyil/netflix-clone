import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';

class VideoWidgets extends StatelessWidget {
  const VideoWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            newAndHotTempImg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kwhiteColor,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
