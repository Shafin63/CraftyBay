import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushNamedAndRemoveUntil(
      context,
      SignUpScreen.name,
      (predicate) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AppLogo(),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
