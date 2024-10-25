import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:genius/domain_layer/business/connected_user.dart';

import 'application_layer/main_page.dart';
import 'domain_layer/firebase_options.dart';
import 'domain_layer/firestore_data_provider.dart';

void main() async {
  const connectedUserId = "SlF76lNTx8QBkhBdDxir";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var dp = FirestoreDataProvider();
  var userData = await dp.readUser(connectedUserId);
  final connectedUser = ConnectedUser();
  connectedUser.clear();
  connectedUser.initialize(
      id: userData?.id ?? connectedUserId,
      coinsWallet: userData?.coinsWallet ?? 0,
      name: userData?.name ?? "",
      picture: userData?.picture ?? "");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genius',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
