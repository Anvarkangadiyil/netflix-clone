import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_app/core/constants.dart';

import 'package:netflix_clone_app/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone_app/presentation/home/widgets/number_title_card_list.dart';
import 'package:netflix_clone_app/presentation/widgets/main_title_card_list.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);

            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTitleCardListView(
                    title: "Realead in the past year",
                  ),
                  MainTitleCardListView(title: "Trending Now"),
                  NumberTitleCardListView(),
                  MainTitleCardListView(title: "Tense Dramas"),
                  MainTitleCardListView(title: "Sounth Indian Cinema"),
                ],
              ),
              scrollNotifier.value
                  ? AnimatedContainer(
                      duration: Duration(microseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        children: [
                          kheight,
                          Row(
                            children: [
                              Image.network(
                                  height: 40,
                                  width: 40,
                                  "https://cdn-icons-png.flaticon.com/128/732/732228.png"),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              kwidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kwidth
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TV Shows",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Movies",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Categories",
                                style: kHomeTitleText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : kheight,
            ],
          ),
        );
      },
    ));
  }
}
