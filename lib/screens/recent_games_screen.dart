import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/recent_game_card.dart';

class RecentGamesScreen extends StatefulWidget {
  const RecentGamesScreen({super.key});

  @override
  _RecentGamesScreenState createState() => _RecentGamesScreenState();
}

class _RecentGamesScreenState extends State<RecentGamesScreen> {
  List<String> recentGames = [];

  @override
  void initState() {
    super.initState();
    loadRecentGames();
  }

  // Load recent games from shared preferences
  void loadRecentGames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recentGames = prefs.getStringList('recent_games') ?? [];
    });
  }

  // Delete a game from recent games list and save to shared preferences
  void deleteGame(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentGames.removeAt(index);
    await prefs.setStringList('recent_games', recentGames);
    setState(() {}); // Rebuild UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Games'),
        centerTitle: true,
      ),
      body: recentGames.isEmpty
          ? const Center(child: Text("No recent games"))
          : ListView.builder(
        itemCount: recentGames.length,
        itemBuilder: (context, index) {
          return RecentGameCard(
            gameResult: recentGames[index],
            datePlayed: "2024-10-17",  // Example date (replace with actual dates)
            onDelete: () => deleteGame(index),
          );
        },
      ),
    );
  }
}
