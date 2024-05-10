import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedFontSize: 11,
          selectedFontSize: 13,
          onTap: (value) {
            indexChangeNotifier.value = value;
          },
          currentIndex: newIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          items: const [
            // Home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

            // New and Hot

            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: 'New & Hot'),

            // Fast laughs
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              label: 'Fast Laughs',
            ),

            // Search
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

            // Downloads
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_down_sharp), label: 'Download'),
          ],
        );
      },
    );
  }
}
