import 'package:flutter/material.dart';

class VowelButton extends StatelessWidget {
  final String vowel;
  final VoidCallback? onTap;
  final double size;
  final double fontSize;
  final bool isHighlighted;

  const VowelButton({
    super.key,
    required this.vowel,
    this.onTap,
    this.size = 60.0,
    this.fontSize = 18.0,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue[100] : Colors.white,
        borderRadius: BorderRadius.circular(size * 0.2), // 12px for 60px size
        border: Border.all(
          color: isHighlighted ? Colors.blue[300]! : Colors.grey[300]!,
          width: isHighlighted ? 2.0 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
                color: isHighlighted ? Colors.blue[700] : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
