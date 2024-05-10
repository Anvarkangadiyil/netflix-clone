import 'package:flutter/cupertino.dart';
import 'package:netflix_clone_app/domain/core/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/main_title.dart';
import 'package:netflix_clone_app/presentation/widgets/main_card.dart';

class MainTitleCardListView extends StatelessWidget {
  const MainTitleCardListView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MainCard();
              },
              itemCount: 10,
              separatorBuilder: (context, index) => kwidth,
            ),
          )
        ],
      ),
    );
  }
}
