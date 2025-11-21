import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_data.dart';

class AuthController extends GetxController{

//   *** SIGNUP MODULE ****

  RxString selectedCountry = ''.obs;
  Rxn<DateTime> selectedDateOfBirth = Rxn<DateTime>();

  // Map to track selected languages and their proficiency levels
  // Key: language name, Value: proficiency level (0-4: Beginner to Proficient)
  RxMap<String, int> selectedLanguages = <String, int>{}.obs;
  RxString searchQuery = ''.obs;
  RxString selectedGender = ''.obs;
  // Track which languages are expanded
  RxSet<String> expandedLanguages = <String>{}.obs;
  // Trigger variable to force reactivity updates
  RxInt _updateTrigger = 0.obs;
  // Store first 2 characters of all selected languages (e.g., "EN, SP, FR")
  RxString selectedLanguagesStartText = ''.obs;

  // *** LEARNING LANGUAGES MODULE ***
  // Track selected learning languages (no proficiency levels)
  RxSet<String> selectedLearningLanguages = <String>{}.obs;
  // Trigger variable for learning languages reactivity updates
  RxInt _learningLanguagesUpdateTrigger = 0.obs;
  // Store first 2 characters of all selected learning languages (e.g., "EN, SP, FR")
  RxString selectedLearningLanguagesStartText = ''.obs;

  /// Toggle expansion state for a language
  void toggleLanguageExpansion(String language) {
    if (expandedLanguages.contains(language)) {
      expandedLanguages.remove(language);
    } else {
      expandedLanguages.add(language);
    }
    // Trigger reactivity by updating the trigger
    _updateTrigger.value++;
  }

  /// Select or deselect a proficiency level for a language
  void selectLanguageLevel(String language, int level) {
    if (selectedLanguages[language] == level) {
      // Deselect if same level is clicked
      selectedLanguages.remove(language);
    } else {
      selectedLanguages[language] = level;
    }
    // Trigger reactivity by updating the trigger
    _updateTrigger.value++;
    // Update selected languages start text
    _updateSelectedLanguagesStartText();
  }

  /// Update the selectedLanguagesStartText with first 2 characters of each selected language
  void _updateSelectedLanguagesStartText() {
    if (selectedLanguages.isEmpty) {
      selectedLanguagesStartText.value = '';
      return;
    }
    
    // Get all selected language names, extract first 2 characters (uppercase), and join with comma
    final codes = selectedLanguages.keys
        .map((language) {
          // Get first 2 characters, convert to uppercase
          if (language.length >= 2) {
            return language.substring(0, 2).toUpperCase();
          } else if (language.length == 1) {
            // If language name is only 1 character, use it with a space or just the character
            return language.toUpperCase();
          }
          return '';
        })
        .where((code) => code.isNotEmpty)
        .toList();
    
    selectedLanguagesStartText.value = codes.join(', ');
  }
  
  /// Get update trigger for reactivity
  int get updateTrigger => _updateTrigger.value;

  /// Check if a language is expanded
  bool isLanguageExpanded(String language) {
    return expandedLanguages.contains(language);
  }

  /// Get selected level for a language
  int? getLanguageLevel(String language) {
    return selectedLanguages[language];
  }

  // Get filtered countries based on search query
  List<Map<String, String>> get filteredCountries {
    if (searchQuery.value.isEmpty) {
      return AppData.allCountries;
    }
    return AppData.allCountries
        .where((country) =>
        country['name']!.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  // Get filtered languages based on search query
  List<String> get filteredLanguages {
    if (searchQuery.value.isEmpty) {
      return AppData.allLanguages;
    }
    return AppData.allLanguages
        .where((language) =>
        language.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  // *** LEARNING LANGUAGES METHODS ***

  /// Toggle selection of a learning language
  void toggleLearningLanguage(String language) {
    if (selectedLearningLanguages.contains(language)) {
      selectedLearningLanguages.remove(language);
    } else {
      selectedLearningLanguages.add(language);
    }
    // Trigger reactivity by updating the trigger
    _learningLanguagesUpdateTrigger.value++;
    // Update selected learning languages start text
    _updateSelectedLearningLanguagesStartText();
  }

  /// Check if a learning language is selected
  bool isLearningLanguageSelected(String language) {
    return selectedLearningLanguages.contains(language);
  }

  /// Get update trigger for learning languages reactivity
  int get learningLanguagesUpdateTrigger => _learningLanguagesUpdateTrigger.value;

  /// Update the selectedLearningLanguagesStartText with first 2 characters of each selected learning language
  void _updateSelectedLearningLanguagesStartText() {
    if (selectedLearningLanguages.isEmpty) {
      selectedLearningLanguagesStartText.value = '';
      return;
    }
    
    // Get all selected learning language names, extract first 2 characters (uppercase), and join with comma
    final codes = selectedLearningLanguages
        .map((language) {
          // Get first 2 characters, convert to uppercase
          if (language.length >= 2) {
            return language.substring(0, 2).toUpperCase();
          } else if (language.length == 1) {
            // If language name is only 1 character, use it
            return language.toUpperCase();
          }
          return '';
        })
        .where((code) => code.isNotEmpty)
        .toList();
    
    selectedLearningLanguagesStartText.value = codes.join(', ');
  }
}
