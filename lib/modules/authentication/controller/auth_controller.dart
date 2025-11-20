import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_strings.dart';

class AuthController extends GetxController{

//   *** SIGNUP MODULE ****
  RxString selectedCountry = ''.obs;
  RxString searchQuery = ''.obs;

  // Get filtered countries based on search query
  List<Map<String, String>> get filteredCountries {
    if (searchQuery.isEmpty) {
      return AppStrings.allCountries;
    }
    return AppStrings.allCountries
        .where((country) =>
        country['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}
