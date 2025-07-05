import 'package:flutter/material.dart';
import 'bengali/bengali_keyboard.dart';
import 'common/game_board.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top part - 10% (flex: 1)
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue[100],
                child: const Center(
                  child: Text(
                    'TOP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            // Center part - 60% (flex: 6) - Game Board
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: const GameBoard(),
              ),
            ),

            // Bottom part - 30% (flex: 3) - Bengali Keyboard
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[50],
                child: const BengaliKeyboard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
