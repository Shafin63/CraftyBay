import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..loadInitialLanguage(),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            initialRoute: SplashScreen.name,
            onGenerateRoute: AppRoutes.routes,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: .light,

            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('bn'), // Bangla
            ],
            locale: languageProvider.currentLocale,
          );
        },
      ),
    );
  }
}
