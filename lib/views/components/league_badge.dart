import 'package:flutter/material.dart';

import '../resources/genius_colors.dart';

class LeagueBadge extends StatelessWidget {
  const LeagueBadge(
      {super.key,
      required this.league,
      required this.rank,
      required this.color,
      required this.width,
      required this.height});

  final String league;
  final int rank;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var fontSize = height / 2;
    var paddingLeft = width / 10;
    var paddingRight = width / 15;

    return DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        child: Stack(children: [
          Container(
              padding: EdgeInsets.only(right: paddingRight),
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("#$rank", style: TextStyle(color: color)))),
          Container(
              padding: EdgeInsets.only(left: paddingLeft),
              width: width - (1 / 3) * width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(league,
                      style: const TextStyle(color: GeniusColors.textLight))))
        ]));
  }
}
