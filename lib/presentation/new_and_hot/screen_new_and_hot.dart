import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_app/domain/core/colors/colors.dart';
import 'package:netflix_clone_app/domain/core/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/app_bar_widgets.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            actions: [
              Text(
                "New & Hot",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast, color: Colors.white),
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth
            ],
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.transparent,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                //tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: kRadius30,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("🍿 Coming Soon")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "👀 Everyone's watching",
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildTabBarView("coming soon"),
          _buildTabBarView("every one is watching"),
        ]),
      ),
    );
  }

  _buildTabBarView(String name) {
    return Center(
      child: Text(name),
    );
  }
}
