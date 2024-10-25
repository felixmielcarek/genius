import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                child: Row(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: GeniusColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5)
                          ]),
                      child: ClipOval(
                          child:
                              Image.memory(connectedUser.picture, height: 35))),
                  Column(children: [
                    Row(children: [
                      SvgPicture.asset('assets/icons/coins.svg',
                          semanticsLabel: 'Coin icon', height: 20),
                      Text(connectedUser.coinsWallet.toString())
                    ]),
                    const Text("Champion")
                  ]),
                  const Spacer(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 40,
                          width: 135,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                  colors: [
                                    GeniusColors.accentStart,
                                    GeniusColors.accentEnd
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topCenter)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/icons/shop.svg',
                                    height: 25),
                                const Text('Boutique',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: GeniusColors.textPrimary))
                              ])))
                ])),
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
