import 'package:flutter/cupertino.dart';

class SearchTextTile extends StatelessWidget {
  const SearchTextTile({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
