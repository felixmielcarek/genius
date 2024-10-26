import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/premium_countdown.dart';
import 'package:genius/views/components/profile_stat_tile.dart';
import 'package:genius/views/resources/genius_colors.dart';
import 'package:intl/intl.dart';

import '../../domain/business/user.dart';
import '../components/league_badge.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.user});

  final User user;
  final frFormat = NumberFormat("#,###", "fr_FR");
  final usFormat = NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: GeniusColors.secondary,
                child: Column(children: [
                  SizedBox(
                      height: 370,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        DefaultTextStyle(
                            style:
                                const TextStyle(color: GeniusColors.textLight),
                            child: Container(
                                height: 300,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF181650),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 40, left: 30, right: 30),
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
                                            height: 90,
                                            child: Stack(children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFdfa582),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            blurRadius: 5)
                                                      ]),
                                                  child: ClipOval(
                                                      child: Image.memory(
                                                          user.picture,
                                                          height: 80))),
                                              Positioned(
                                                  top: 57,
                                                  left: 57,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                            width: 32,
                                                            height: 32,
                                                            child: CircularProgressIndicator(
                                                                value: (user.xp %
                                                                        1000) /
                                                                    1000,
                                                                strokeWidth:
                                                                    3.5,
                                                                valueColor: AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    GeniusColors
                                                                        .progress
                                                                        .withOpacity(
                                                                            0.7)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white)),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 30,
                                                            height: 30,
                                                            decoration: const BoxDecoration(
                                                                color:
                                                                    GeniusColors
                                                                        .primary,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Text(
                                                                      "Niv",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          height:
                                                                              1)),
                                                                  Text(
                                                                      "${user.xp ~/ 1000}",
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16,
                                                                          height:
                                                                              1))
                                                                ]))
                                                      ]))
                                            ])),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5, bottom: 8),
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
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                            badges.Badge(
                                                badgeStyle:
                                                    const badges.BadgeStyle(
                                                        padding:
                                                            EdgeInsets.all(6)),
                                                position: badges.BadgePosition
                                                    .topStart(start: -5),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color:
                                                          GeniusColors.primary),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/screw.svg',
                                                    color: Colors.white,
                                                  ),
                                                )),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15),
                                                child: badges.Badge(
                                                    badgeStyle:
                                                        const badges.BadgeStyle(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6)),
                                                    position: badges
                                                            .BadgePosition
                                                        .topStart(start: -5),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: GeniusColors
                                                              .primary),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/trophy.svg',
                                                        color: Colors.white,
                                                      ),
                                                    ))),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15),
                                                child: badges.Badge(
                                                    badgeStyle:
                                                        const badges.BadgeStyle(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6)),
                                                    position: badges
                                                            .BadgePosition
                                                        .topStart(start: -5),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: GeniusColors
                                                              .primary),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/postit.svg',
                                                        color: Colors.white,
                                                      ),
                                                    ))),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color:
                                                        GeniusColors.primary),
                                                child: SvgPicture.asset(
                                                    'assets/icons/share.svg',
                                                    color: Colors.white))
                                          ]))
                                    ])))),
                        Positioned(
                            top: 250,
                            child: SizedBox(
                                height: 130,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                          height: 100,
                                          width: 320,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFc0d0ff),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 2)
                                              ]),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                    top: -5,
                                                    child: Stack(
                                                        children: <Widget>[
                                                          ImageFiltered(
                                                              imageFilter:
                                                                  ImageFilter.dilate(
                                                                      radiusX:
                                                                          1,
                                                                      radiusY:
                                                                          1),
                                                              child: Image.asset(
                                                                  'assets/images/gamepass.png',
                                                                  color: Colors
                                                                      .white,
                                                                  width: 200)),
                                                          Image.asset(
                                                              'assets/images/gamepass.png',
                                                              width: 200)
                                                        ])),
                                                Positioned(
                                                    top: 44,
                                                    left: 24,
                                                    child: Container(
                                                        width: 234,
                                                        height: 18,
                                                        color: GeniusColors
                                                            .secondary)),
                                                Positioned(
                                                    top: 42,
                                                    left: 20,
                                                    child: Container(
                                                      width: 140,
                                                      height: 22,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                          color: GeniusColors
                                                              .primary),
                                                    )),
                                                Positioned(
                                                    top: 20,
                                                    child: Image.asset(
                                                        'assets/images/progressbar.png',
                                                        width: 300)),
                                                Positioned(
                                                    top: 43,
                                                    left: 50,
                                                    child: Text(
                                                        frFormat.format(
                                                            user.passPoints),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: GeniusColors
                                                                .textLight))),
                                                const Positioned(
                                                    top: 43,
                                                    left: 215,
                                                    child: Text("2000",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: GeniusColors
                                                                .primary)))
                                              ])),
                                      Positioned(
                                          top: 82,
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 100,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                  color: GeniusColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        blurRadius: 3)
                                                  ],
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text("Voir plus",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: GeniusColors
                                                                .textLight)),
                                                    Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 5),
                                                        child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 20))
                                                  ])))
                                    ])))
                      ])),
                  DefaultTextStyle(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GeniusColors.textPrimary),
                      child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(children: [
                            Row(children: [
                              Expanded(
                                  child: SizedBox(
                                      height: 140,
                                      child: ProfileStatTile(
                                          icon: 'assets/icons/shield.svg',
                                          title: "Classement Ligue",
                                          value: frFormat
                                              .format(user.leagueRank)))),
                              Expanded(
                                  child: SizedBox(
                                      height: 140,
                                      child: ProfileStatTile(
                                          icon: 'assets/icons/crown.svg',
                                          title: "Classement\nHall of Fame",
                                          value:
                                              frFormat.format(user.hofRank)))),
                              Expanded(
                                  child: SizedBox(
                                      height: 140,
                                      child: ProfileStatTile(
                                          icon:
                                              'assets/icons/field_primary.svg',
                                          title: "Nombre de parties\ngagnées",
                                          value: frFormat
                                              .format(user.gamesPlayed))))
                            ]),
                            SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: ProfileStatTile(
                                    title:
                                        "Nombre total de Genius Coins générés",
                                    valueIcon: 'assets/icons/coins.svg',
                                    value: frFormat.format(user.coinsTotal))),
                            Row(children: [
                              Expanded(
                                  child: SizedBox(
                                      height: 100,
                                      child: ProfileStatTile(
                                          title: "Taux de cotes\nvalidés",
                                          value:
                                              "${user.validatedOddsRate}%"))),
                              Expanded(
                                  child: SizedBox(
                                      height: 100,
                                      child: ProfileStatTile(
                                          title: "Taux de parties\ngagnantes",
                                          value: "${user.winningRate}%"))),
                              Expanded(
                                  child: SizedBox(
                                      height: 100,
                                      child: ProfileStatTile(
                                          title:
                                              "Taux de pronos\nrapides réussis",
                                          value:
                                              "${user.quickPredictionsRate}%")))
                            ]),
                            Container(
                                height: 40,
                                margin: const EdgeInsets.only(top: 50),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 3)
                                    ]),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("Voir toutes les stats",
                                          style: TextStyle(fontSize: 18)),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          child: const Icon(
                                              Icons.add_circle_outline,
                                              color: GeniusColors.primary,
                                              size: 22))
                                    ]))
                          ])))
                ]))));
  }
}
