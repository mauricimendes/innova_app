import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';
import 'package:innova_app/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    final themeNofifier = Provider.of<ThemeNotifier>(context);

    handleChangleTheme(bool value) {
      themeNofifier.setTheme(value);
    }

    return Drawer(
      backgroundColor: theme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: theme.container),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Switch(
                    activeColor: theme.green,
                    value: themeNofifier.getTheme(),
                    onChanged: (bool value) => {handleChangleTheme(value)},
                  ),
                  DefaultTextStyle(
                      style: TextStyle(color: theme.primary, fontSize: 16),
                      child: const Text('Dark Mode'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
