import 'package:flutter/material.dart';
import 'package:flutter_custom_theme/flutter_custom_theme.dart';
import 'package:innova_app/pages/home.dart';
import 'package:innova_app/pages/login.dart';
import 'package:innova_app/theme/custom_theme.dart';
import 'package:innova_app/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return ThemeNotifier(true);
    },
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNofifier = Provider.of<ThemeNotifier>(context);

    return CustomThemes(
        data: [
          themeNofifier.getTheme()
              ? const CustomTheme.dark()
              : const CustomTheme.light()
        ],
        child: MaterialApp(
          title: 'Theme',
          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          routes: {
            '/home': (context) => const Home(),
            '/login': (context) => const Login(),
          },
        ));
  }
}
