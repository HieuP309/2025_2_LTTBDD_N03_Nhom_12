import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../locale_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() =>
      _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(
      context,
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.language,
              style: const TextStyle(fontSize: 18),
            ),

            Row(
              children: [
                Text(l10n.vietnamese),

                Switch(
                  value:
                      localeProvider.locale.languageCode ==
                      'en',
                  onChanged: (value) {
                    localeProvider.toggleLanguage();
                  },
                ),

                Text(l10n.english),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
