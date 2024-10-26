import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/league_badge.dart';
import 'package:genius/views/components/progress_frame.dart';

import '../../domain/business/user.dart';
import '../resources/genius_colors.dart';

class MainAppbar extends StatelessWidget {
  final User connectedUser = User.connectedUserInstance;

  MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double pictureFrameRadius = 50;
    double pictureFrameThickness = 2;

    return Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 1)
        ]),
        child: Row(children: [
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: ProgressFrame(
                progress: (connectedUser.xp % 1000) / 1000,
                background: GeniusColors.orange,
                content: ClipOval(child: Image.memory(connectedUser.picture)),
                frameRadius: pictureFrameRadius,
                frameThickness: pictureFrameThickness,
              )),
          Container(
              margin: const EdgeInsets.only(left: 8, top: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      SvgPicture.asset('assets/icons/coins.svg',
                          semanticsLabel: 'Coin icon', height: 20),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(connectedUser.coinsWallet.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: GeniusColors.textPrimary)))
                    ]),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: LeagueBadge(
                            league: connectedUser.league,
                            rank: connectedUser.leagueRank,
                            color: GeniusColors.royalBlue,
                            height: 20,
                            width: 100))
                  ])),
          const Spacer(),
          Align(
              alignment: Alignment.bottomLeft,
              child: badges.Badge(
                  badgeStyle:
                      const badges.BadgeStyle(padding: EdgeInsets.all(5)),
                  badgeContent: const Text('1',
                      style: TextStyle(
                          color: GeniusColors.textLight, fontSize: 8)),
                  position: badges.BadgePosition.topEnd(top: -6, end: 8),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 10),
                      height: 32,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 2)
                          ],
                          gradient: const LinearGradient(
                              colors: [
                                GeniusColors.accent,
                                GeniusColors.orange
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.topRight)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/icons/shop.svg',
                                height: 20),
                            const Text('Boutique',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: GeniusColors.textPrimary))
                          ]))))
        ]));
  }
}
