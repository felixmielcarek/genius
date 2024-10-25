import 'dart:typed_data';

class User {
  User(
      this.id,
      this.coinsWallet,
      this.name,
      this.picture,
      this.coinsTotal,
      this.gamesPlayed,
      this.hofRank,
      this.league,
      this.leagueRank,
      this.passPoints,
      this.quickPredictionsRate,
      this.validatedOddsRate,
      this.winningRate,
      this.xp);

  // Private static instance for the connected user
  static User? _connectedUser;

  // Regular fields for User instances
  final String id;
  final int coinsWallet;
  final String name;
  final Uint8List picture;
  final int coinsTotal;
  final int gamesPlayed;
  final int hofRank;
  final String league;
  final int leagueRank;
  final int passPoints;
  final int quickPredictionsRate;
  final int validatedOddsRate;
  final int winningRate;
  final int xp;

  // Factory constructor to return the single connected user instance
  factory User.connectedUserInit(
      {required String id,
      required int coinsWallet,
      required String name,
      required Uint8List picture,
      required int coinsTotal,
      required int gamesPlayed,
      required int hofRank,
      required String league,
      required int leagueRank,
      required int passPoints,
      required int quickPredictionsRate,
      required int validatedOddsRate,
      required int winningRate,
      required int xp}) {
    // Create the connected user instance if it doesn't exist
    _connectedUser ??= User(
        id,
        coinsWallet,
        name,
        picture,
        coinsTotal,
        gamesPlayed,
        hofRank,
        league,
        leagueRank,
        passPoints,
        quickPredictionsRate,
        validatedOddsRate,
        winningRate,
        xp);
    return _connectedUser!;
  }

  // Method to reset connected user (useful for logout)
  static void resetConnectedUser() {
    _connectedUser = null;
  }

  // Static getter to access the connected user instance
  static User get connectedUserInstance {
    if (_connectedUser == null) {
      throw Exception('Connected user is not initialized');
    }
    return _connectedUser!;
  }
}
