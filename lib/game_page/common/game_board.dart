import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  final int rows;
  final int columns;

  const GameBoard({super.key, this.rows = 11, this.columns = 11});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<String?>> _board;

  @override
  void initState() {
    super.initState();
    _board = List.generate(
      widget.rows,
      (_) => List.filled(widget.columns, null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Board background
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: List.generate(widget.rows, (row) {
            return Expanded(
              child: Row(
                children: List.generate(widget.columns, (col) {
                  final isCenter =
                      row == widget.rows ~/ 2 && col == widget.columns ~/ 2;
                  final akshara = _board[row][col];
                  final isFilled = akshara != null;
                  return Expanded(
                    child: DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        final isHovering =
                            candidateData.isNotEmpty && !isFilled;
                        return Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: isFilled
                                ? Colors.yellow.shade100
                                : (isHovering
                                      ? Colors.blue.shade100
                                      : Colors.white),
                            border: Border.all(
                              color: Colors.grey[400]!,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: isFilled
                                ? Text(
                                    akshara!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                  )
                                : (isCenter
                                      ? Text(
                                          '★',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange[700],
                                          ),
                                        )
                                      : null),
                          ),
                        );
                      },
                      onWillAcceptWithDetails: (details) {
                        print(
                          'onWillAcceptWithDetails: \\${details.data} at cell ($row, $col)',
                        );
                        return !isFilled &&
                            details.data != null &&
                            details.data.isNotEmpty;
                      },
                      onAcceptWithDetails: (details) {
                        print(
                          'onAcceptWithDetails: \\${details.data} at cell ($row, $col)',
                        );
                        setState(() {
                          _board[row][col] = details.data;
                        });
                      },
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
