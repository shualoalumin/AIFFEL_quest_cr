import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile settings'),
            subtitle: Text('Settings regarding your profile'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            subtitle: Text('When would you like to be notified'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
          SwitchListTile(
            title: Text(
                'Language: ${themeProvider.locale.languageCode == 'en' ? 'English' : 'Korean'}'),
            value: themeProvider.locale.languageCode == 'ko',
            onChanged: (value) {
              themeProvider.toggleLanguage(value);
            },
          ),
          // Add more ListTiles as needed
        ],
      ),
    );
  }
}
