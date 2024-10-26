import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/league_badge.dart';
import 'package:genius/views/pages/ranking_page.dart';
import 'package:genius/views/resources/genius_colors.dart';

import '../../domain/business/user.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final User connectedUser = User.connectedUserInstance;

  final List<Widget> _children = [
    const RankingPage(),
    const RankingPage(),
    const RankingPage(),
    const RankingPage(),
    const RankingPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ]),
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 5)
                              ]),
                          child: Stack(alignment: Alignment.center, children: [
                            SizedBox(
                                width: 53,
                                height: 53,
                                child: CircularProgressIndicator(
                                    value: (connectedUser.xp % 1000) / 1000,
                                    strokeWidth: 3.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        GeniusColors.progress.withOpacity(0.7)),
                                    backgroundColor: Colors.white)),
                            Container(
                                decoration: const BoxDecoration(
                                    color: GeniusColors.accentEnd,
                                    shape: BoxShape.circle),
                                child: ClipOval(
                                    child: Image.memory(connectedUser.picture,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover)))
                          ])),
                      Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  SvgPicture.asset('assets/icons/coins.svg',
                                      semanticsLabel: 'Coin icon', height: 20),
                                  Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: Text(
                                          connectedUser.coinsWallet.toString(),
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
                                        color: GeniusColors.primary,
                                        height: 20,
                                        width: 100))
                              ])),
                      const Spacer(),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: badges.Badge(
                              badgeStyle: const badges.BadgeStyle(
                                  padding: EdgeInsets.all(6)),
                              badgeContent: const Text('1',
                                  style: TextStyle(
                                      color: GeniusColors.textLight,
                                      fontSize: 10)),
                              position: badges.BadgePosition.topEnd(end: 8),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, right: 10),
                                  height: 40,
                                  width: 135,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 2)
                                      ],
                                      gradient: const LinearGradient(
                                          colors: [
                                            GeniusColors.accentStart,
                                            GeniusColors.accentEnd
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topCenter)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/shop.svg',
                                            height: 25),
                                        const Text('Boutique',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color:
                                                    GeniusColors.textPrimary))
                                      ]))))
                    ]))),
            body: _children[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/podium${_selectedIndex == 0 ? '_primary' : ''}.svg',
                          height: 30),
                      label: 'Classements'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/trophy${_selectedIndex == 1 ? '_primary' : ''}.svg',
                          height: 30),
                      label: 'Tournois'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/stadium${_selectedIndex == 2 ? '_primary' : ''}.svg',
                          height: 30),
                      label: 'Acceuil'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/field${_selectedIndex == 3 ? '_primary' : ''}.svg',
                          height: 30),
                      label: 'Matchs'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/ticket${_selectedIndex == 4 ? '_primary' : ''}.svg',
                          height: 30),
                      label: 'Mes Pronos')
                ],
                onTap: onTabTapped,
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: GeniusColors.primary,
                unselectedItemColor: Colors.black,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 10))));
  }
}
