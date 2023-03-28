import 'package:flutter/material.dart';

class CardTitlesWidget extends StatelessWidget {
  final String title;
  bool isTitle;

  CardTitlesWidget({required this.title, required this.isTitle});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: mediaQuery - 180,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
                fontSize: isTitle ? 16 : 14,
              ),
        ),
      ),
    );
  }
}
