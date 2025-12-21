import 'package:crafty_bay/app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Text(AppLocalizations.of(context)!.changeTheme),
        DropdownMenu<ThemeMode>(
          initialSelection: themeProvider.currentThemeMode,
          onSelected: (ThemeMode? mode) {
            if (mode == null) return;
            context.read<ThemeProvider>().changeThemeMode(mode);
          },
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: ThemeMode.system, label: 'System'),
            DropdownMenuEntry(value: ThemeMode.light, label: 'Light'),
            DropdownMenuEntry(value: ThemeMode.dark, label: 'Dark'),
          ],
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
