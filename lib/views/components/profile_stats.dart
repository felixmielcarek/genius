import 'package:flutter/material.dart';
import 'package:genius/views/components/profile_stat_tile.dart';
import 'package:intl/intl.dart';

import '../../domain/business/user.dart';
import '../resources/genius_colors.dart';

class ProfileStats extends StatelessWidget {
  final User user;

  final frFormat = NumberFormat("#,###", "fr_FR");

  ProfileStats({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double firstRowHeight = 130;
    double secondRowHeight = 80;
    double thirdRowHeight = 90;

    return DefaultTextStyle(
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: GeniusColors.textPrimary),
        child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(children: [
              Row(children: [
                Expanded(
                    child: SizedBox(
                        height: firstRowHeight,
                        child: ProfileStatTile(
                            icon: 'assets/icons/shield.svg',
                            title: "Classement Ligue",
                            value: frFormat.format(user.leagueRank)))),
                Expanded(
                    child: SizedBox(
                        height: firstRowHeight,
                        child: ProfileStatTile(
                            icon: 'assets/icons/crown.svg',
                            title: "Classement\nHall of Fame",
                            value: frFormat.format(user.hofRank)))),
                Expanded(
                    child: SizedBox(
                        height: firstRowHeight,
                        child: ProfileStatTile(
                            icon: 'assets/icons/field_primary.svg',
                            title: "Nombre de parties\ngagnées",
                            value: frFormat.format(user.gamesPlayed))))
              ]),
              SizedBox(
                  height: secondRowHeight,
                  width: double.infinity,
                  child: ProfileStatTile(
                      title: "Nombre total de Genius Coins générés",
                      valueIcon: 'assets/icons/coins.svg',
                      value: frFormat.format(user.coinsTotal))),
              Row(children: [
                Expanded(
                    child: SizedBox(
                        height: thirdRowHeight,
                        child: ProfileStatTile(
                            title: "Taux de cotes\nvalidés",
                            value: "${user.validatedOddsRate}%"))),
                Expanded(
                    child: SizedBox(
                        height: thirdRowHeight,
                        child: ProfileStatTile(
                            title: "Taux de parties\ngagnantes",
                            value: "${user.winningRate}%"))),
                Expanded(
                    child: SizedBox(
                        height: thirdRowHeight,
                        child: ProfileStatTile(
                            title: "Taux de pronos\nrapides réussis",
                            value: "${user.quickPredictionsRate}%")))
              ]),
              Container(
                  height: 32,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5), blurRadius: 3)
                      ]),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Text("Voir toutes les stats",
                        style: TextStyle(fontSize: 16)),
                    Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: const Icon(Icons.add_circle_outline,
                            color: GeniusColors.primary, size: 22))
                  ]))
            ])));
  }
}
