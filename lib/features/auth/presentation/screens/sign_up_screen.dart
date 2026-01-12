import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/sign_up_params.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpProvider _signUpProvider = SignUpProvider();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_) => _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    AppLogo(width: 90),
                    SizedBox(height: 8),
                    Text(
                      context.localizations.signUp,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      context.localizations.getStarted,
                      textAlign: .center,
                      style: textTheme.bodyLarge?.copyWith(fontWeight: .w400),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _firstNameTEController,
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
                      controller: _lastNameTEController,
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
                      controller: _emailTEController,
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
                      controller: _passwordTEController,
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
                      controller: _mobileTEController,
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
                      controller: _cityTEController,
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
                    Consumer<SignUpProvider>(
                      builder: (context, signUpProvider, child) {
                        return Visibility(
                          visible: signUpProvider.isSignUpInProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: FilledButton(
                            onPressed: _onTapSignUpButton,
                            child: Text(context.localizations.signUp),
                          ),
                        );
                      },
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
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    final bool isSuccess = await _signUpProvider.signUp(
      SignUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        mobile: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
      ),
    );
    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_signUpProvider.errorMessage!)));
    }
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    super.dispose();
  }
}
