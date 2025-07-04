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
  String?
  filteringConsonant; // Track which consonant is being used for filtering

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

  // Bengali consonants (ব্যঞ্জনবর্ণ) - True consonants only
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
  ];

  // Auxiliary orthographic signs
  static const List<String> auxiliarySigns = [
    'ৎ', // khanda ta
    'ং', // anusvara
    'ঃ', // visarga
    'ঁ', // candrabindu
  ];

  // Most common Bengali conjuncts
  static const List<String> commonConjuncts = [
    // ক-based conjuncts
    'ক্ক', 'ক্ত', 'ক্ষ', 'ক্ষ্ম', 'ক্র', 'ক্ল', 'ক্ব',
    // চ-based conjuncts
    'চ্চ',
    // ত-based conjuncts
    'ত্ত', 'ত্র', 'থ্র',
    // দ-based conjuncts
    'দ্দ', 'দ্র', 'ধ্র',
    // ন-based conjuncts
    'ন্দ', 'ন্ত', 'ন্ম', 'ন্ব', 'ন্র',
    // ঙ-based conjuncts
    'ঙ্গ',
    // প-based conjuncts
    'প্ত', 'প্ল', 'প্র', 'প্স',
    // ম-based conjuncts
    'ম্প', 'ম্ল', 'ম্র', 'ম্ব',
    // ব-based conjuncts
    'ব্র', 'ভ্র',
    // ল-based conjuncts
    'ল্ল',
    // শ/ষ/স-based conjuncts
    'শ্র', 'ষ্ট', 'ষ্ম', 'স্থ', 'স্প', 'স্ম', 'স্ন', 'স্ল',
    // হ-based conjuncts
    'হ্ম',
    // গ-based conjuncts
    'গ্র',
    // জ-based conjuncts
    'জ্ঞ',
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

  List<String> _getFilteredConjuncts() {
    if (filteringConsonant == null) {
      // Show all conjuncts when no filtering is active
      return commonConjuncts;
    } else {
      // Filter conjuncts that start with the filtering consonant
      return commonConjuncts
          .where((conjunct) => conjunct.startsWith(filteringConsonant!))
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
        Expanded(
          flex: 1,
          child: Container(
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
                          selectedConsonant =
                              null; // Reset to show basic vowels
                          selectedConjunct = null;
                          filteringConsonant = null; // Clear filtering
                        });
                        print('Selected akshara: $item');
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        // Second row - Consonants
        Expanded(
          flex: 1,
          child: Container(
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
                          if (selectedConsonant == consonant) {
                            // If same consonant is clicked again, deselect it
                            selectedConsonant = null;
                            filteringConsonant = null; // Clear filtering
                          } else {
                            // Select new consonant and clear any selected conjunct
                            selectedConsonant = consonant;
                            filteringConsonant = consonant; // Set filtering
                            selectedConjunct = null;
                          }
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
        ),

        // Third row - Hasanta and Common Conjuncts
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Row(
              children: [
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
                      children: _getFilteredConjuncts().map((conjunct) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: VowelButton(
                            vowel: conjunct,
                            onTap: () {
                              setState(() {
                                if (selectedConjunct == conjunct) {
                                  // If same conjunct is clicked again, deselect it
                                  selectedConjunct = null;
                                  filteringConsonant =
                                      null; // Clear filtering to show all conjuncts
                                } else {
                                  // Select new conjunct and clear any selected consonant
                                  selectedConjunct = conjunct;
                                  selectedConsonant = null;
                                  // Keep filteringConsonant unchanged to maintain filtered view
                                }
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
        ),

        // Fourth row - Reset button and Auxiliary Signs
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Row(
              children: [
                // Reset button
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
                          filteringConsonant = null; // Clear filtering
                        });
                        print('Clear button pressed');
                      },
                      child: const Center(
                        child: Icon(
                          Icons.refresh,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Vertical divider
                Container(width: 2, height: 50, color: Colors.grey),
                const SizedBox(width: 8),
                // Scrollable auxiliary signs (disabled in initial state)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: auxiliarySigns.map((auxSign) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Disabled appearance
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                auxSign,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.grey[500], // Disabled text color
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
