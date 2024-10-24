import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/application_layer/genius_colors.dart';
import 'package:genius/application_layer/ranking_page.dart';

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
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0), child: Row()),
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
              label: 'Mes Pronos'),
        ],
        onTap: onTabTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: GeniusColors.primary,
        unselectedItemColor: Colors.black,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}
