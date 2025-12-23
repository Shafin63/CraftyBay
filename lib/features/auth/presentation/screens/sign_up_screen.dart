import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 70),
                Text(context.localizations.signUp),
                Text(context.localizations.getStarted),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: context.localizations.firstName),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: context.localizations.lastName),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: context.localizations.email),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: context.localizations.password),
                  validator: (String? value) {
                    if(value?.isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: context.localizations.mobile),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: .onUserInteraction,
                  decoration: InputDecoration(hintText: context.localizations.city),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true) {
                      return context.localizations.cannotBeEmpty;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
