import 'dart:async';

import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int _secondsLeft = 120;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    // start countdown
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_secondsLeft <= 0) {
        timer.cancel();
        // ensure UI shows 0
        setState(() {});
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 90),
                SizedBox(height: 8),
                Text(
                  context.localizations.enterOTP,
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text(
                  context.localizations.digitOTP,
                  textAlign: .center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: .w400,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 16),

                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    inactiveColor: AppColors.themeColor,
                    inactiveFillColor: Colors.white,
                    activeColor: AppColors.themeColor,
                    selectedColor: AppColors.themeColor,
                    selectedFillColor: Colors.white,
                    borderWidth: 1,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  // enableActiveFill: true,
                  // controller: _pinTEController,
                  appContext: context,
                ),

                SizedBox(height: 4),
                FilledButton(
                  onPressed: _onTapVerifyOtpButton,
                  child: Text(context.localizations.verify),
                ),
                const SizedBox(height: 8),
                // show countdown next to the message
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This code will expire in ',
                      style: const TextStyle(color: Colors.black45),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${_secondsLeft}s',
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _onTapResendOtpButton,
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      fontWeight: .normal,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyOtpButton() {}

  void _onTapResendOtpButton() {}
}
