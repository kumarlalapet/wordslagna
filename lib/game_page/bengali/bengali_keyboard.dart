import 'package:flutter/material.dart';
import '../common/vowel_button.dart';

class BengaliKeyboard extends StatefulWidget {
  const BengaliKeyboard({super.key});

  @override
  State<BengaliKeyboard> createState() => _BengaliKeyboardState();
}

class _BengaliKeyboardState extends State<BengaliKeyboard> {
  String? selectedConsonant;

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

  List<String> _getVowelRowItems() {
    if (selectedConsonant == null) {
      // Show just vowels when no consonant is selected
      return vowels;
    } else {
      // Show consonant + vowel combinations with proper akshara formation
      return vowels
          .map((vowel) => _combineConsonantVowel(selectedConsonant!, vowel))
          .toList();
    }
  }

  String _combineConsonantVowel(String consonant, String vowel) {
    // Map of vowels to their corresponding diacritical marks
    const Map<String, String> vowelMarks = {
      'অ': '', // inherent vowel, no mark needed
      'আ': 'া',
      'ই': 'ি',
      'ঈ': 'ী',
      'উ': 'ু',
      'ঊ': 'ূ',
      'ঋ': 'ৃ',
      'এ': 'ে',
      'ঐ': 'ৈ',
      'ও': 'ো',
      'ঔ': 'ৌ',
    };

    String vowelMark = vowelMarks[vowel] ?? '';

    if (vowelMark.isEmpty) {
      // For অ (inherent vowel), just return the consonant
      return consonant;
    } else {
      // For other vowels, combine consonant with vowel mark
      return consonant + vowelMark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - Vowels or Consonant + Vowels
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _getVowelRowItems().map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: VowelButton(
                    vowel: item,
                    onTap: () {
                      // TODO: Handle akshara selection
                      print('Selected akshara: $item');
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
                      setState(() {
                        selectedConsonant = consonant;
                      });
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
