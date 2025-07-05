import 'package:flutter/material.dart';

class VowelButton extends StatelessWidget {
  final String vowel;
  final VoidCallback? onTap;
  final double size;
  final double fontSize;
  final bool isHighlighted;
  final bool isDraggable;
  final bool isGreyedOut;

  const VowelButton({
    super.key,
    required this.vowel,
    this.onTap,
    this.size = 60.0,
    this.fontSize = 18.0,
    this.isHighlighted = false,
    this.isDraggable = false,
    this.isGreyedOut = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on draggable state, highlight state, and greyed out
    Color backgroundColor;
    Color borderColor;
    Color shadowColor;
    double borderWidth;

    if (isGreyedOut) {
      backgroundColor = Colors.grey[200]!;
      borderColor = Colors.grey[400]!;
      shadowColor = Colors.grey.withOpacity(0.1);
      borderWidth = 1.0;
    } else if (isDraggable) {
      backgroundColor = isHighlighted
          ? Colors.yellow.shade200
          : Colors.yellow.shade100;
      borderColor = isHighlighted
          ? Colors.yellow.shade700
          : Colors.yellow.shade600;
      shadowColor = Colors.yellow.withOpacity(0.3);
      borderWidth = 2.0;
    } else {
      backgroundColor = isHighlighted ? Colors.blue[100]! : Colors.white;
      borderColor = isHighlighted ? Colors.blue[300]! : Colors.grey[300]!;
      shadowColor = Colors.grey.withOpacity(0.2);
      borderWidth = isHighlighted ? 2.0 : 1.0;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size * 0.2), // 12px for 60px size
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size * 0.2),
          onTap: onTap,
          child: Center(
            child: Text(
              vowel,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: isGreyedOut
                    ? Colors.grey[500]
                    : (isHighlighted ? Colors.blue[700] : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
