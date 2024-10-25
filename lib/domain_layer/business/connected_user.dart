import 'package:genius/domain_layer/business/user.dart';

class ConnectedUser {
  // Static instance of the singleton
  static final ConnectedUser _instance = ConnectedUser._internal();

  // Private constructor
  ConnectedUser._internal();

  // Factory constructor to return the same instance
  factory ConnectedUser() {
    return _instance;
  }

  // Define the fields for the connected user
  String? id;
  int? coinsWallet;
  String? name;
  String? picture;
  int? coinsTotal;
  List<User>? friends;
  int? gamesPlayed;
  int? hofRank;
  String? league;
  int? leagueRank;
  int? passPoints;
  int? quickPredictionsRate;
  int? validatedOddsRate;
  int? winningRate;
  int? xp;

  void initialize(
      {required String id,
      required int coinsWallet,
      required String name,
      required String picture}) {
    this.id = id;
    this.coinsWallet = coinsWallet;
    this.name = name;
    this.picture = picture;
  }

  void clear() {
    id = null;
    coinsWallet = null;
    name = null;
    picture = null;
    coinsTotal = null;
    friends = null;
    gamesPlayed = null;
    hofRank = null;
    league = null;
    leagueRank = null;
    passPoints = null;
    quickPredictionsRate = null;
    validatedOddsRate = null;
    winningRate = null;
    xp = null;
  }
}
