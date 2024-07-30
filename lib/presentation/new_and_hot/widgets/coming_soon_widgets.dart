import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/home/widgets/custom_botton_widgets.dart';
import 'package:netflix_clone_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Container(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidgets(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALL GIRL TWO",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -6),
                  ),
                  //const Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications_rounded,
                        label: 'Remid me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        label: 'info',
                        iconSize: 20,
                        textSize: 12,
                      )
                    ],
                  )
                ],
              ),
              const Text("Comming On WednesDay"),
              kheight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              const Text(
                "Landing the lead in the school musical is a \nthe dream come true for jodi, untill the pressure \nsends her confidence --- and her relationship ---\ninto a tailspin ",
                style: TextStyle(
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
