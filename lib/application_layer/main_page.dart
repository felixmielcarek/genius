import 'package:flutter/material.dart';
import 'package:genius/application_layer/ranking_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0), child: Row()),
      body: const RankingPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Classements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tournois',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Matchs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Mes Pronos',
          ),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
