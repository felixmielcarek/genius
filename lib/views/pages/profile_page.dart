import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/premium_countdown.dart';
import 'package:genius/views/components/profile_picture.dart';
import 'package:genius/views/components/profile_stats.dart';
import 'package:genius/views/components/progress_frame.dart';
import 'package:genius/views/components/tools_tiles.dart';
import 'package:genius/views/resources/genius_colors.dart';
import 'package:intl/intl.dart';

import '../../domain/business/user.dart';
import '../components/league_badge.dart';
import '../components/pass_banner.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.user});

  final User user;
  final usFormat = NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    var userLevel = user.xp ~/ 1000;
    var userProgress = (user.xp % 1000) / 1000;

    return SafeArea(
        child: Scaffold(
            body: Container(
                color: GeniusColors.secondary,
                child: Column(children: [
                  SizedBox(
                      height: 385,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        DefaultTextStyle(
                            style:
                                const TextStyle(color: GeniusColors.textLight),
                            child: Container(
                                height: 315,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF181650),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 55, left: 30, right: 30),
                                    child: Row(children: [
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                    width: 85,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: GeniusColors
                                                            .primary),
                                                    child: Row(children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/chevron.svg',
                                                          height: 25),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          child: const Text(
                                                              "Retour",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))
                                                    ]))),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 50),
                                                child: const PremiumCountdown())
                                          ])),
                                      Column(children: [
                                        SizedBox(
                                            width: 90,
                                            height: 95,
                                            child: Stack(children: [
                                              ProfilePicture(
                                                picture: user.picture,
                                                background:
                                                    const Color(0xFFdfa582),
                                                frameThickness: 4,
                                                height: 80,
                                              ),
                                              Positioned(
                                                  top: 55,
                                                  left: 36,
                                                  child: ProgressFrame(
                                                      progress: userProgress,
                                                      background: const Color(
                                                          0xFF4451b3),
                                                      frameRadius: 34,
                                                      frameThickness: 1.5,
                                                      content: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text("Niv",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    height: 1)),
                                                            Text("$userLevel",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16,
                                                                    height: 1))
                                                          ])))
                                            ])),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(user.name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24))),
                                        LeagueBadge(
                                            league: user.league,
                                            rank: user.leagueRank,
                                            color: const Color(0xFFc0d0ff),
                                            width: 120,
                                            height: 25),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                      usFormat
                                                          .format(
                                                              user.coinsWallet)
                                                          .replaceAll(',', '.'),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 26)),
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/coins.svg',
                                                          height: 28))
                                                ]))
                                      ]),
                                      const Expanded(child: ToolsTiles())
                                    ])))),
                        Positioned(
                            top: 265,
                            child: PassBanner(points: user.passPoints))
                      ])),
                  ProfileStats(user: user)
                ]))));
  }
}
