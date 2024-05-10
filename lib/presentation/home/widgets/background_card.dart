import 'package:flutter/material.dart';
import 'package:netflix_clone_app/domain/core/colors/colors.dart';
import 'package:netflix_clone_app/presentation/home/widgets/custom_botton_widgets.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://media.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidget(
                icon: Icons.add,
                label: 'My List',
              ),
              _PlayButton(),
              CustomButtonWidget(
                icon: Icons.info_outline,
                label: 'Info',
              )
            ],
          ),
        )
      ],
    );
  }
}

TextButton _PlayButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(kBlackColor),
      backgroundColor: MaterialStateProperty.all(kwhiteColor),
      shape: MaterialStateProperty.all(LinearBorder.none),
      elevation: MaterialStateProperty.all(0),
    ),
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
    ),
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Text(
        'Play',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  );
}
