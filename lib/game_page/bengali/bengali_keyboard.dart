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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - Vowels (33% of bottom section)
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
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
        ),

        // Placeholder for second row - Consonants (33% of bottom section)
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'Consonants Row (Coming Soon)',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ),

        // Placeholder for third row - Conjuncts (33% of bottom section)
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                'Conjuncts Row (Coming Soon)',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
