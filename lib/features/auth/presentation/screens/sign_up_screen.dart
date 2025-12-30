import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 90),
                SizedBox(height: 8),
                Text(
                  context.localizations.signUp,
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text(
                  context.localizations.getStarted,
                  style: textTheme.bodyLarge?.copyWith(fontWeight: .w400),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(
                    hintText: context.localizations.firstName,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(
                    hintText: context.localizations.lastName,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
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
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
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
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  keyboardType: .phone,
                  textInputAction: .next,
                  decoration: InputDecoration(
                    hintText: context.localizations.mobile,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  decoration: InputDecoration(
                    hintText: context.localizations.city,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4),
                FilledButton(
                  onPressed: _onTapSignUpButton,

                  child: Text(context.localizations.signUp),
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

  void _onTapSignUpButton() {}

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

}