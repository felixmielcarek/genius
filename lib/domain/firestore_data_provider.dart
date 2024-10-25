import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:genius/domain/business/user.dart';

class FirebaseDataProvider {
  Future<User?> readUser(String userId) async {
    const oneMegabyte = 1024 * 1024;
    User? res;

    final db = FirebaseFirestore.instance;
    final storageRef = FirebaseStorage.instance.ref();

    await db
        .collection("users")
        .doc(userId)
        .get()
        .then((DocumentSnapshot doc) async {
      final data = doc.data() as Map<String, dynamic>;

      final islandRef = storageRef.child(data["picture"]);
      final Uint8List? picture = await islandRef.getData(oneMegabyte);

      res = User(
          userId,
          data["coinsWallet"],
          data["name"],
          picture!,
          data["coinsTotal"],
          data["gamesPlayed"],
          data["hofRank"],
          data["league"],
          data["leagueRank"],
          data["passPoints"],
          data["quickPredictionsRate"],
          data["validatedOddsRate"],
          data["winningRate"],
          data["xp"]);
    });
    return res;
  }

  Future<Set<User>?> readFriends(String userId) async {
    var db = FirebaseFirestore.instance;

    var friends = [];
    await db.collection("users").doc(userId).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      friends = data["friends"];
    });

    var res = <User>{};
    for (var friend in friends) {
      var user = await readUser(friend);
      if (user != null) res.add(user);
    }
    return res;
  }
}
