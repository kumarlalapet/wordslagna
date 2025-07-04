import 'package:flutter/material.dart';

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

            // Center part - 60% (flex: 6)
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.green[100],
                child: const Center(
                  child: Text(
                    'CENTER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),

            // Bottom part - 30% (flex: 3)
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.orange[100],
                child: const Center(
                  child: Text(
                    'BOTTOM',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
