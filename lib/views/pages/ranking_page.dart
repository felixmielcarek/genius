import 'package:flutter/material.dart';
import 'package:genius/views/pages/profile_page.dart';
import 'package:genius/views/resources/genius_colors.dart';

import '../../domain/business/user.dart';
import '../../domain/firestore_data_provider.dart';
import '../components/ranking_item.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  _RankingPageState() {
    friends.add(connectedUser);
  }

  final connectedUser = User.connectedUserInstance;
  var friends = <User>[];

  Future<void> getFriends() async {
    var dp = FirebaseDataProvider();
    var friendsDto = await dp.readFriends(connectedUser.id);
    if (friendsDto == null) return;

    setState(() {
      friends.addAll(friendsDto);
      friends.sort((a, b) => b.coinsWallet.compareTo(a.coinsWallet));
    });
  }

  @override
  void initState() {
    super.initState();
    getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        decoration: const BoxDecoration(color: GeniusColors.secondary),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Classement \namis".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: GeniusColors.textPrimary,
                    height: 1)),
          ),
          Container(
              padding: const EdgeInsets.only(
                  top: 10, right: 30, bottom: 20, left: 15),
              child: const Text(
                  "Compare ton classement avec tes amis et regarde lequel est le meilleur d'entre vous",
                  style: TextStyle(
                      fontSize: 14,
                      color: GeniusColors.textPrimary,
                      height: 1.2))),
          ...List.generate(friends.length, (index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: friends[index]),
                    ),
                  );
                },
                child: RankingItem(
                  rank: index + 1,
                  picture: friends[index].picture,
                  name: friends[index].name,
                  score: friends[index].coinsWallet,
                  toAccent: friends[index].id == connectedUser.id,
                ));
          })
        ]));
  }
}
