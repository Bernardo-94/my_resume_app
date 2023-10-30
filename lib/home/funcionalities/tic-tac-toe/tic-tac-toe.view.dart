import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, '');
  bool isPlayerX = true;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jogo da Velha',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: board.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (board[index] == '' && !checkWinner()) {
                      setState(() {
                        board[index] = isPlayerX ? 'X' : 'O';
                        isPlayerX = !isPlayerX;
                        if (!isPlayerX) {
                          playComputerMove();
                        }
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                );
              },
            ),
            checkWinner()
                ? Text(
                    isPlayerX ? 'Você ganhou!' : 'Jogador O ganhou!',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
            ElevatedButton(
              onPressed: () {
                resetGame();
              },
              child: const Text('Reiniciar Jogo'),
            ),
          ],
        ),
      ),
    );
  }

  void playComputerMove() {
    List<int> emptyCells = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        emptyCells.add(i);
      }
    }
    if (emptyCells.isNotEmpty) {
      int randomIndex = random.nextInt(emptyCells.length);
      setState(() {
        board[emptyCells[randomIndex]] = 'O';
        isPlayerX = true;
      });
    }
  }

  bool checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != '' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        return true;
      }
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        return true;
      }
    }

    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
      return true;
    }

    if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
      return true;
    }

    return false;
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isPlayerX = true;
    });
  }
}
