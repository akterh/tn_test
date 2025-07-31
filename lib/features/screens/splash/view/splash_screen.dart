import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tn_test/core/constants/app_colors.dart';

import '../../../../core/app/app_context.dart';
import '../../../../core/app/app_dependency.dart';
import '../../../../core/app/app_preference.dart';
import '../../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _onNavigateScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
          child: Hero(
            tag: 'logo',
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onNavigateScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      final appPreferences = instance.get<AppPreferences>();
      final isUserLoggedIn = appPreferences.isUserLoggedIn();
      GetContext.offAllAndToNamed(
        Routes.home,
      );
    });
  }
}
