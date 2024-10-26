import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'domain/business/user.dart';
import 'domain/firebase_options.dart';
import 'domain/firestore_data_provider.dart';
import 'views/pages/main_page.dart';

void main() async {
  const connectedUserId = "SlF76lNTx8QBkhBdDxir";

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var dp = FirebaseDataProvider();
  var dto = await dp.readUser(connectedUserId);
  if (dto != null) {
    User.connectedUserInit(
        id: dto.id,
        coinsWallet: dto.coinsWallet,
        name: dto.name,
        picture: dto.picture,
        coinsTotal: dto.coinsTotal,
        gamesPlayed: dto.gamesPlayed,
        hofRank: dto.hofRank,
        league: dto.league,
        leagueRank: dto.leagueRank,
        passPoints: dto.passPoints,
        quickPredictionsRate: dto.quickPredictionsRate,
        validatedOddsRate: dto.validatedOddsRate,
        winningRate: dto.winningRate,
        xp: dto.xp);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Genius',
        theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
        home: const MainPage());
  }
}
