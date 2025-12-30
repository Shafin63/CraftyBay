import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
                  style: textTheme.bodyLarge?.copyWith(fontWeight: .w400, color: Colors.black45),
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
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    text: context.localizations.alreadyHaveAccount,
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: .w700,
                        ),
                        text: context.localizations.signIn,
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  void _onTapVerifyOtpButton() {}
}


