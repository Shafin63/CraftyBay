import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppLogo(width: 90),
                SizedBox(height: 15),
                Text(
                  context.localizations.signIn,
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                const SizedBox(height: 4),
                Text(
                  context.localizations.enterDetails,
                  textAlign: .center,
                  style: textTheme.bodyLarge?.copyWith(fontWeight: .w400),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  keyboardType: .emailAddress,
                  textInputAction: .next,
                  decoration: InputDecoration(
                    hintText: context.localizations.email,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: context.localizations.password,
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: _onTapForgotPasswordButton,
                      child: Text(context.localizations.forgotPassword),
                    ),
                  ],
                ),
                FilledButton(
                  onPressed: _onTapSignInButton,
                  child: Text(context.localizations.signIn),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    text: context.localizations.dontHaveAccount,
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: .w700,
                        ),
                        text: context.localizations.signUp,
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignUpButton,
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

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapSignInButton() {

  }
}
