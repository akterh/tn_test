import 'package:easy_localization/easy_localization.dart';

import '../constants/app_strings.dart';
import '../constants/strings.dart';

class Validator {
  static String? fullName(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpFullNameRequiredErr.tr();
    }

    if (v.length < 2) return AppStrings.signUpFullNameMinLengthErr.tr();

    return null;
  }

  // static String? fName(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressFirstNameRequired.tr();
  //   }
  //
  //   return null;
  // }
  //
  // static String? lName(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressLastNameRequired.tr();
  //   }
  //
  //   return null;
  // }

  // static String? companyName(String? v) {
  //   if (v == null || v == '') return null;
  //
  //   if (v.length > 100) {
  //     return AppStrings.checkoutAddressCompanyNameMax100Char.tr();
  //   }
  //
  //   return null;
  // }
  //
  // static String? country(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressCountryOrRegionRequired.tr();
  //   }
  //
  //   if (v.length > 100) {
  //     return AppStrings.checkoutAddressCountryOrRegionMax100.tr();
  //   }
  //
  //   return null;
  // }
  //
  // static String? street(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressStreetRequired.tr();
  //   }
  //
  //   if (v.length > 100) return AppStrings.checkoutAddressStreetMax100.tr();
  //
  //   return null;
  // }
  //
  // static String? city(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressLocationOrCityRequired.tr();
  //   }
  //
  //   if (v.length > 100) {
  //     return AppStrings.checkoutAddressLocationOrCityMax100.tr();
  //   }
  //
  //   return null;
  // }
  //
  // static String? postCode(String? v) {
  //   if (v == null || v == '') {
  //     return AppStrings.checkoutAddressPostalCodeRequired.tr();
  //   }
  //
  //   if (v.length > 100) return AppStrings.checkoutAddressPostalCodeMax100.tr();
  //
  //   return null;
  // }
  //
  // static String? comments(String? v) {
  //   if (v == null || v == '') return null;
  //
  //   if (v.length > 500) return AppStrings.checkoutAddressCommentsMax500.tr();
  //
  //   return null;
  // }

  static String? email(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpEmailRequiredErr.tr();
    }

    if (!emailValidatorRegExp.hasMatch(v)) {
      return AppStrings.signUpEmailRequiredErr.tr();
    }

    return null;
  }

  static String? phone(String? v) {
    if (v == null || v == '') {
      return AppStrings.provideValidNumber.tr();
    }

    if (!mobileNumberRegex.hasMatch(v)) {
      return AppStrings.provideValidNumber.tr();
    }

    return null;
  }


  static String? dob(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpDobRequiredErr.tr();
    }

    return null;
  }
  
  static String? gender(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpDobRequiredErr.tr();
    }

    return null;
  }



}
