import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/main_appbar.dart';
import 'package:genius/views/pages/ranking_page.dart';
import 'package:genius/views/resources/genius_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

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
    double iconsHeight = 32;

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(92.0),
                child: MainAppbar()),
            body: _children[_selectedIndex],
            bottomNavigationBar: SizedBox(
                height: 77,
                child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/icons/podium${_selectedIndex == 0 ? '_primary' : ''}.svg',
                              height: iconsHeight),
                          label: 'Classements'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/icons/trophy${_selectedIndex == 1 ? '_primary' : ''}.svg',
                              height: iconsHeight),
                          label: 'Tournois'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/icons/stadium${_selectedIndex == 2 ? '_primary' : ''}.svg',
                              height: 30),
                          label: 'Acceuil'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/icons/field${_selectedIndex == 3 ? '_primary' : ''}.svg',
                              height: iconsHeight),
                          label: 'Matchs'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/icons/ticket${_selectedIndex == 4 ? '_primary' : ''}.svg',
                              height: iconsHeight),
                          label: 'Mes Pronos')
                    ],
                    onTap: onTabTapped,
                    currentIndex: _selectedIndex,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: GeniusColors.primary,
                    unselectedItemColor: const Color(0xff3b5163),
                    selectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                    unselectedLabelStyle: const TextStyle(
                        color: GeniusColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10)))));
  }
}
