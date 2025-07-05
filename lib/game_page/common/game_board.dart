import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final int rows;
  final int columns;

  const GameBoard({super.key, this.rows = 11, this.columns = 11});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Board background
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: List.generate(rows, (row) {
            return Expanded(
              child: Row(
                children: List.generate(columns, (col) {
                  final isCenter = row == rows ~/ 2 && col == columns ~/ 2;
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: isCenter
                            ? Text(
                                '★',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[700],
                                ),
                              )
                            : null,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}
