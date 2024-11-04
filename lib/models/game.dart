class Game {
  List<String?> board = List.filled(9, null);
  String currentPlayer = 'X';
  bool gameOver = false;
  String? winner;
  String difficulty = 'hard';  // Fixed to "hard"

  final List<List<int>> winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  // Make a move
  void makeMove(int index) {
    if (board[index] == null && !gameOver) {
      board[index] = currentPlayer;
      checkWinner();
      if (!gameOver) {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }

  // Check for a winner
  void checkWinner() {
    for (var combo in winningCombinations) {
      if (board[combo[0]] != null &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[0]] == board[combo[2]]) {
        winner = board[combo[0]];
        gameOver = true;
        return;
      }
    }
    if (!board.contains(null)) {
      winner = 'Draw';
      gameOver = true;
    }
  }

  // Hard AI using Minimax Algorithm
  void aiMove() {
    if (!gameOver) {
      int bestMove = _minimax(true, 0)['index'];
      makeMove(bestMove);
    }
  }

  // Minimax Algorithm with depth limit for performance
  Map<String, dynamic> _minimax(bool isMaximizing, int depth) {
    if (depth >= 6) return {'score': 0};  // Depth limit

    String? result = checkWinnerForMinimax();
    if (result != null) {
      if (result == 'X') return {'score': -10 + depth};  // AI loses
      if (result == 'O') return {'score': 10 - depth};   // AI wins
      if (result == 'Draw') return {'score': 0};         // Draw
    }

    List<int> availableMoves = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == null) {
        availableMoves.add(i);
      }
    }

    List<Map<String, dynamic>> moves = [];

    for (var move in availableMoves) {
      Map<String, dynamic> moveMap = {};
      moveMap['index'] = move;
      board[move] = isMaximizing ? 'O' : 'X';  // AI plays 'O', Player plays 'X'

      if (isMaximizing) {
        moveMap['score'] = _minimax(false, depth + 1)['score'];
      } else {
        moveMap['score'] = _minimax(true, depth + 1)['score'];
      }

      board[move] = null; // Reset the move
      moves.add(moveMap);
    }

    Map<String, dynamic> bestMove = {};
    if (isMaximizing) {
      int bestScore = -1000;
      for (var move in moves) {
        if (move['score'] > bestScore) {
          bestScore = move['score'];
          bestMove = move;
        }
      }
    } else {
      int bestScore = 1000;
      for (var move in moves) {
        if (move['score'] < bestScore) {
          bestScore = move['score'];
          bestMove = move;
        }
      }
    }

    return bestMove;
  }

  // Check winner for minimax without ending the real game
  String? checkWinnerForMinimax() {
    for (var combo in winningCombinations) {
      if (board[combo[0]] != null &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[0]] == board[combo[2]]) {
        return board[combo[0]];
      }
    }
    if (!board.contains(null)) {
      return 'Draw';
    }
    return null;
  }

  // Reset the game
  void resetGame() {
    board = List.filled(9, null);
    currentPlayer = 'X';
    gameOver = false;
    winner = null;
  }
}
