import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/home/widgets/custom_botton_widgets.dart';
import 'package:netflix_clone_app/presentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          "This hit sitcom follows the merry misadventures of six 20 -something pals as they navigate the pitfalls of work, life and love in 1990s Manhatten",
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kheight50,
        const VideoWidgets(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            kwidth,
            CustomButtonWidget(
              icon: Icons.send,
              label: 'Share',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              label: 'MyList',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow_rounded,
              label: 'info',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
