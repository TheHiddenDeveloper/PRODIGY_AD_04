import 'package:flutter/material.dart';
import '../models/game.dart';

class GameBoard extends StatefulWidget {
  final Game game;
  final bool isAI;

  const GameBoard({super.key, required this.game, required this.isAI});

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (!widget.game.gameOver && widget.game.board[index] == null) {
                  setState(() {
                    widget.game.makeMove(index);
                  });

                  // If AI, let it make a move after the player
                  if (widget.isAI && !widget.game.gameOver) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        widget.game.aiMove();
                      });
                    });
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),  // Green grid lines
                ),
                child: Center(
                  child: Text(
                    widget.game.board[index] ?? '',
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.green,  // Player's letter (X or O) is green
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          widget.game.winner != null
              ? (widget.game.winner == 'Draw' ? 'It\'s a Draw!' : '${widget.game.winner} Wins!')
              : 'Player ${widget.game.currentPlayer}\'s turn',
          style: const TextStyle(fontSize: 24),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.game.resetGame();
            });
          },
          child: const Text('Reset Game'),
        ),
      ],
    );
  }
}
