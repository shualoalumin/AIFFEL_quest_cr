import 'package:flutter/material.dart';
import 'app_localizations.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('welcome')),
      ),
      body: Center(
        child: DropdownButton<Locale>(
          items: [
            DropdownMenuItem(
              value: Locale('en', ''),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('ko', ''),
              child: Text('한국어'),
            ),
            DropdownMenuItem(
              value: Locale('ja', ''),
              child: Text('日本語'),
            ),
          ],
          onChanged: (Locale? newLocale) {
            
          },
        ),
      ),
    );
  }
}
