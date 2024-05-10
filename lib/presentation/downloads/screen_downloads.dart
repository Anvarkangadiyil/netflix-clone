import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone_app/domain/core/colors/colors.dart';
import 'package:netflix_clone_app/domain/core/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List _widgetList = [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: const AppBarWidget(
              title: "Downloads",
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemCount: _widgetList.length,
        ));
  }
}

// ! Section 2

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    'https://media.themoviedb.org/t/p/w220_and_h330_face/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    'https://media.themoviedb.org/t/p/w220_and_h330_face/cxevDYdeFkiixRShbObdwAHBZry.jpg',
    'https://media.themoviedb.org/t/p/w220_and_h330_face/A7EByudX0eOzlkQ2FIbogzyazm2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "we will download a personalized selection of \n movies and shows for you, so there's \n always something to watch on your \n device",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kwidth,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                image: imageList[0],
                margin: EdgeInsets.only(left: 170, top: 50),
                angle: 25,
                size: Size(size.width * 0.35, size.width * 0.55),
                radius: 8,
              ),
              DownloadsImageWidget(
                image: imageList[1],
                margin: EdgeInsets.only(
                  right: 170,
                  top: 50,
                ),
                angle: -25,
                size: Size(size.width * 0.35, size.width * 0.55),
                radius: 8,
              ),
              DownloadsImageWidget(
                image: imageList[2],
                margin: EdgeInsets.only(bottom: 40, top: 50),
                angle: 0,
                size: Size(size.width * 0.4, size.width * 0.6),
                radius: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ! Section 3

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ! Section 1

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text(
          "Smart Downloads",
          style: TextStyle(
              fontFamily: AutofillHints.username,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  DownloadsImageWidget({
    super.key,
    required this.image,
    required this.margin,
    required this.size,
    this.radius = 0,
    this.angle = 0,
  });

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
