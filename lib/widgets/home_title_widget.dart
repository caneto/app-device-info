import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  final String title;

  HomeTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
          ),
        ],
      ),
    );
  }
}
