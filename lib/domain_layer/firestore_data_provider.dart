import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:genius/domain_layer/business/user.dart';

class FirestoreDataProvider {
  Future<User?> readUser(String userId) async {
    var db = FirebaseFirestore.instance;
    User? res;
    await db.collection("users").doc(userId).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      res = User(userId, data["coinsWallet"], data["name"], data["picture"]);
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
