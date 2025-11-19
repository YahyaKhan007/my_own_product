abstract class AppTranslation {
  static const String english = 'en_US';
  static const String urdu = 'ur';
  static const String arabic = 'ar';

  static Map<String, String> languageNames = {
    english: 'English', // English name for English
    urdu: 'اردو', // Native name for Urdu
    arabic: 'العربية',
  };

  static Map<String, Map<String, String>> translationsKeys = {english: enUS, arabic: ar, urdu: ur};
}

final Map<String, String> ur = {};
final Map<String, String> ar = {};
final Map<String, String> enUS = {};
