import 'package:flutter/foundation.dart';

const bool debugMode = true;

void printLog(String text) {
  if (debugMode) {
    if (kDebugMode) {
      print("tn_test App : $text");
    }
  }
}
