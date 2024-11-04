import 'package:flutter/material.dart';
import 'package:tic_tac_toe_task/widgets/game_board.dart';
import '../models/game.dart';

class GameScreen extends StatefulWidget {
  final bool isAI;

  GameScreen({required this.isAI});  // Removed difficulty parameter

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Game game = Game();  // No need to pass difficulty here, it defaults to hard in the model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAI ? 'Player vs AI' : 'Player vs Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameBoard(game: game, isAI: widget.isAI),
        ],
      ),
    );
  }
}
