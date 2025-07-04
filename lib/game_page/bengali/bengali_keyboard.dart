import 'package:flutter/material.dart';
import '../common/vowel_button.dart';

class BengaliKeyboard extends StatefulWidget {
  const BengaliKeyboard({super.key});

  @override
  State<BengaliKeyboard> createState() => _BengaliKeyboardState();
}

class _BengaliKeyboardState extends State<BengaliKeyboard> {
  String? selectedConsonant;
  String? selectedConjunct;

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

  // Most common Bengali conjuncts
  static const List<String> commonConjuncts = [
    'ক্ত',
    'ক্ষ',
    'ক্র',
    'ক্ল',
    'ক্ব',
    'স্ত',
    'স্প',
    'স্ম',
    'স্ন',
    'স্ল',
    'ন্দ',
    'ন্ত',
    'ন্ম',
    'ন্ব',
    'ন্র',
    'প্ত',
    'প্ল',
    'প্র',
    'প্স',
    'ম্প',
    'ম্ল',
    'ম্র',
    'ম্ব',
    'ত্র',
    'থ্র',
    'দ্র',
    'ধ্র',
    'ব্র',
    'ভ্র',
    'ম্র',
    'শ্র',
    'ষ্ম',
    'স্ম',
  ];

  List<String> _getVowelRowItems() {
    if (selectedConjunct != null) {
      // Show conjunct + vowel combinations
      return vowels
          .map((vowel) => _combineConsonantVowel(selectedConjunct!, vowel))
          .toList();
    } else if (selectedConsonant != null) {
      // Show consonant + vowel combinations with proper akshara formation
      return vowels
          .map((vowel) => _combineConsonantVowel(selectedConsonant!, vowel))
          .toList();
    } else {
      // Show just vowels when no consonant or conjunct is selected
      return vowels;
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
                      setState(() {
                        selectedConsonant = null; // Reset to show basic vowels
                        selectedConjunct = null;
                      });
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
                        selectedConjunct = null; // Clear any selected conjunct
                      });
                      print('Selected consonant: $consonant');
                    },
                    isHighlighted: selectedConsonant == consonant,
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Third row - Clear, Hasanta, and Common Conjuncts
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Row(
            children: [
              // Clear button
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      setState(() {
                        selectedConsonant = null;
                        selectedConjunct = null;
                      });
                      print('Clear button pressed');
                    },
                    child: const Center(
                      child: Icon(Icons.refresh, color: Colors.grey, size: 24),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Hasanta button
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      // TODO: Handle hasanta functionality
                      print('Hasanta button pressed');
                    },
                    child: const Center(
                      child: Text(
                        '্',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Vertical divider
              Container(width: 2, height: 50, color: Colors.grey),
              const SizedBox(width: 8),
              // Scrollable common conjuncts
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: commonConjuncts.map((conjunct) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: VowelButton(
                          vowel: conjunct,
                          onTap: () {
                            setState(() {
                              selectedConjunct = conjunct;
                              selectedConsonant =
                                  null; // Clear any selected consonant
                            });
                            print('Selected conjunct: $conjunct');
                          },
                          isHighlighted: selectedConjunct == conjunct,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
