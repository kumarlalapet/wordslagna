import 'package:flutter/material.dart';

class VowelButton extends StatelessWidget {
  final String vowel;
  final VoidCallback? onTap;
  final double size;
  final double fontSize;

  const VowelButton({
    super.key,
    required this.vowel,
    this.onTap,
    this.size = 60.0,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.2), // 12px for 60px size
        border: Border.all(color: Colors.grey[300]!, width: 1.0),
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
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
