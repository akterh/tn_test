import 'package:tn_test/core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl = 'https://maps.googleapis.com/'; //live server
  static const String devUrl = 'https://maps.googleapis.com/'; // dev server
  static const String testUrl = 'https://maps.googleapis.com/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // shop module
  static const String directionUrl = 'maps/api/directions/json?';
}
