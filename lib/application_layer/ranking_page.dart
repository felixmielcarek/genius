import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/application_layer/genius_colors.dart';

import '../domain_layer/business/connected_user.dart';
import '../domain_layer/business/user.dart';
import '../domain_layer/firestore_data_provider.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  _RankingPageState() {
    final connectedUser = ConnectedUser();
    var currentUser = User(connectedUser.id!, connectedUser.coinsWallet!,
        connectedUser.name!, connectedUser.picture!);
    friends.add(currentUser);
  }

  var friends = <User>[];

  Future<void> getFriends() async {
    final connectedUser = ConnectedUser();
    var dp = FirestoreDataProvider();
    var friendsDto = await dp.readFriends(connectedUser.id!);
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: const BoxDecoration(color: GeniusColors.secondary),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Expanded(
              child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RankingItem(
                      rank: index + 1,
                      picture: friends[index].picture,
                      name: friends[index].name,
                      score: friends[index].coinsWallet,
                      toAccent: friends[index].id == ConnectedUser().id,
                    );
                  }))
        ]));
  }
}

class RankingItem extends StatelessWidget {
  const RankingItem(
      {super.key,
      required this.rank,
      required this.picture,
      required this.name,
      required this.score,
      this.toAccent = false});

  final int rank;
  final String picture;
  final String name;
  final int score;
  final bool toAccent;

  final double biggestTexts = 16;
  final double smallestTexts = 14;
  final double separator = 20;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: toAccent ? GeniusColors.primary : Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Text(rank.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: biggestTexts,
                      color: toAccent
                          ? GeniusColors.textLight
                          : GeniusColors.textPrimary)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("/",
                      style: TextStyle(
                          fontSize: separator,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textSecondary))),
              Container(
                  decoration: BoxDecoration(
                      color: GeniusColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5), blurRadius: 5)
                      ]),
                  child: ClipOval(
                      child: Image(
                          image: AssetImage('assets/$picture'), height: 35))),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: biggestTexts,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textDark))),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(score.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: smallestTexts,
                          color: toAccent
                              ? GeniusColors.textLight
                              : GeniusColors.textDark))),
              SvgPicture.asset('assets/icons/coins.svg',
                  semanticsLabel: 'Coin icon', height: 20)
            ])));
  }
}
