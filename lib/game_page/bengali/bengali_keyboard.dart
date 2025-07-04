import 'package:flutter/material.dart';
import '../common/vowel_button.dart';

class BengaliKeyboard extends StatelessWidget {
  const BengaliKeyboard({super.key});

  // Bengali vowels (স্বরবর্ণ)
  static const List<String> vowels = [
    'অ',
    'আ',
    'ই',
    'ঈ',
    'উ',
    'ঊ',
    'ঋ',
    'এ',
    'ঐ',
    'ও',
    'ঔ',
  ];

  // Bengali consonants (ব্যঞ্জনবর্ণ)
  static const List<String> consonants = [
    'ক',
    'খ',
    'গ',
    'ঘ',
    'ঙ',
    'চ',
    'ছ',
    'জ',
    'ঝ',
    'ঞ',
    'ট',
    'ঠ',
    'ড',
    'ঢ',
    'ণ',
    'ত',
    'থ',
    'দ',
    'ধ',
    'ন',
    'প',
    'ফ',
    'ব',
    'ভ',
    'ম',
    'য',
    'র',
    'ল',
    'শ',
    'ষ',
    'স',
    'হ',
    'ড়',
    'ঢ়',
    'য়',
    'ৎ',
    'ং',
    'ঃ',
    'ঁ',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - Vowels
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: vowels.map((vowel) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: VowelButton(
                    vowel: vowel,
                    onTap: () {
                      // TODO: Handle vowel selection
                      print('Selected vowel: $vowel');
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Second row - Consonants
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: consonants.map((consonant) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: VowelButton(
                    vowel: consonant, // Using same component for now
                    onTap: () {
                      // TODO: Handle consonant selection
                      print('Selected consonant: $consonant');
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Third row - Conjuncts
        Container(
          height: 70,
          color: Colors.grey[300],
          child: const Center(
            child: Text(
              'Conjuncts Row (Coming Soon)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
