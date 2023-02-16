import 'package:flutter/material.dart';
import 'package:innova_app/theme/app_images.dart';
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
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.brand),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  themeNofifier.getTheme()
                      ? AppImages.logoDark
                      : AppImages.logoLight,
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                          style: TextStyle(
                              color: theme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          child: const Text('Bem-vindo')),
                      DefaultTextStyle(
                          style: TextStyle(
                              color: theme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          child: Text('Ao MyTasks'))
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    );
  }
}
