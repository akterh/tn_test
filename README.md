

Flutter Starter” --org com.ecom.axilweb”

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart
$ flutter build apk --flavor development --target lib/main_development.dart
$ flutter build appbundle --flavor development --target lib/main_development.dart


# Staging
$ flutter run --flavor staging --target lib/main_staging.dart[PROD(18-02-2024).apk](build%2Fapp%2Foutputs%2Fflutter-apk%2FPROD%2818-02-2024%29.apk)
$ flutter build apk --flavor staging --target lib/main_staging.dart
$ flutter build appbundle --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
$ flutter build apk --flavor production --target lib/main_production.dart
$ flutter build appbundle --flavor production --target lib/main_production.dart

```

_\*Flutter Starter works on iOS, Android, Web, and Windows._




