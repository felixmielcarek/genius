import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/profile_picture.dart';

import '../resources/genius_colors.dart';

class RankingItem extends StatelessWidget {
  const RankingItem(
      {super.key,
      required this.rank,
      required this.picture,
      required this.name,
      required this.score,
      this.toAccent = false});

  final int rank;
  final Uint8List picture;
  final String name;
  final int score;
  final bool toAccent;

  final double biggestTexts = 16;
  final double smallestTexts = 14;
  final double separator = 20;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 4, bottom: 5),
            decoration: BoxDecoration(
                color: toAccent ? GeniusColors.primary : Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Text(rank.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: biggestTexts,
                      color: toAccent
                          ? GeniusColors.textLight
                          : GeniusColors.primary)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("/",
                      style: TextStyle(
                          fontSize: separator,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textSecondary))),
              ProfilePicture(
                picture: picture,
                background: GeniusColors.primary,
                frameThickness: 2,
                height: 34,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: biggestTexts,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textDark))),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(score.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: smallestTexts,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textDark))),
              SvgPicture.asset('assets/icons/coins.svg',
                  semanticsLabel: 'Coin icon', height: 20)
            ])));
  }
}
