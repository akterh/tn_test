import 'dart:developer';



import '../app/app_dependency.dart';
import '../app/app_preference.dart';

class UrlHelper {
  // ============ [ Privacy Policy And Terms & Conditions ] ============
  static const String baseUrl = 'https://tn_test.ch';
  static const String privacyPolicyEn = '$baseUrl';
  static const String privacyPolicyDe = '$baseUrl';

  static const String termsAndConditionsEn = '$baseUrl';
  static const String termsAndConditionsDe = '$baseUrl';

  // ============ [ Privacy Policy And Terms & Conditions ] ============

  static void openPrivacyPolicy() {
    final preferences = instance.get<AppPreferences>();
    final languageKey = preferences.getLanguage();

    if (languageKey == 'en') navigateToBrowser(privacyPolicyEn);

    if (languageKey == 'de') navigateToBrowser(privacyPolicyDe);
  }

  static void openTermsAndConditions() {
    final preferences = instance.get<AppPreferences>();
    final languageKey = preferences.getLanguage();

    if (languageKey == 'en') navigateToBrowser(termsAndConditionsEn);

    if (languageKey == 'de') navigateToBrowser(termsAndConditionsDe);
  }

  static void navigateToWebView(String title, String url) {
    /*

    GetContext.to(
      StaticWebViewPageScreen(appBarTitle: title, contentDetails: url),
    );

    */
  }

  static Future<void> navigateToBrowser(String url) async {
    try {
      final uri = Uri.parse(url);

      if (true) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      log('UrlHelper:: @navigateToBrowser => $e');
    }
  }
}
