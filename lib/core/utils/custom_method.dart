import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:tn_test/core/constants/app_strings.dart';

extension StringNumberExtraction on String {
  bool? timeEntryStatusCheck() {
    if (this == "pending" || this == "approved") {
      return false;
    } else {
      return true;
    }
  }
}

extension StringFormatter on String {
  /// Replaces placeholders with values provided in [params].
  /// Placeholders should be in the format `{key}`.
  String requestParams(Map<String, dynamic> params) {
    var formattedString = "$this \n$params";

    return formattedString;
  }
}

extension AgeFromStringExtension on String {
  String get ageInYearsAndMonths {
    try {
      final birthDate = DateTime.parse(this);
      final now = DateTime.now();

      int years = now.year - birthDate.year;
      int months = now.month - birthDate.month;

      if (now.day < birthDate.day) {
        months--;
      }

      if (months < 0) {
        years--;
        months += 12;
      }

      return '$years ${AppStrings.years.tr()} $months ${AppStrings.month.tr()}';
    } catch (e) {
      return 'Invalid date';
    }
  }
}

extension StringDateExtensions on String {
  bool is48HoursBeforeNow() {
    try {
      // Parse the string to DateTime
      final date = DateTime.parse(this);
      final now = DateTime.now();
      final difference = date.difference(now);
      log("${difference.inHours}");
      return difference.inHours >= 48;
    } catch (e) {
      // Handle invalid date format
      throw FormatException('Invalid date format. Please use YYYY-MM-DD');
    }
  }
}
