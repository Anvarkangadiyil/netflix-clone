import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_app/presentation/widgets/main_title.dart';

class NumberTitleCardListView extends StatelessWidget {
  const NumberTitleCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Top 10 TV shows in in today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return NumberCard(
                index: index,
              );
            },
            itemCount: 10,
            separatorBuilder: (context, index) => kwidth,
          ),
        )
      ],
    );
  }
}
