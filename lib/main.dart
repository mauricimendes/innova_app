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
    final theme = CustomTheme.of(context);
    final themeNofifier = Provider.of<ThemeNotifier>(context);

    return CustomThemes(
        data: [
          themeNofifier.getTheme()
              ? const CustomTheme.dark()
              : const CustomTheme.light()
        ],
        child: const MaterialApp(
            title: 'Theme', debugShowCheckedModeBanner: false, home: Login()));
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final theme = CustomTheme.of(context);
//     // final themeNofifier = Provider.of<ThemeNotifier>(context);
//     return const Scaffold(
//         // appBar: AppBar(
//         //   actions: [
//         //     TextButton(
//         //         onPressed: () {
//         //           themeNofifier.setTheme(!themeNofifier.getTheme());
//         //         },
//         //         child: Text('teste'))
//         //   ],
//         //   backgroundColor: theme.container,
//         //   title: DefaultTextStyle(
//         //       style: TextStyle(color: theme.primary),
//         //       child: const Text('App Bar')),
//         // ),
//         body: Home());
//   }
// }
