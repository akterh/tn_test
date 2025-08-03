import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tn_test/features/components/custom_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/app.dart';
import 'core/app/app_dependency.dart';
import 'core/app/app_flavor.dart';
import 'core/app_bloc_observer.dart';


void main() async {
  //Init Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Init easy localization
  await EasyLocalization.ensureInitialized();
  //Init modules
  configureInjection();
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.staging;
  configLoading();
  //Init my app with observer
  Bloc.observer = AppBlocObserver();
  await dotenv.load();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      fallbackLocale: const Locale('de'),
      startLocale: const Locale('de'),
      saveLocale: true,
      path: 'assets/translations',
      child: const InitApp(),
    ),
  );
}
