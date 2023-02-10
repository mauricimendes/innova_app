import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';
import 'package:innova_app/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    final themeNofifier = Provider.of<ThemeNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Ink(
            child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              color: theme.container, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.logout,
            color: theme.secondary,
          ),
        )),
        DefaultTextStyle(
            style: TextStyle(
                color: theme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            child: const Text('Tarefas de hoje')),
        Ink(
            decoration: BoxDecoration(
                color: theme.container, borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                themeNofifier.setTheme(!themeNofifier.getTheme());
              },
              child: Container(
                height: 52,
                width: 52,
                child: Icon(
                  Icons.people,
                  color: theme.brand,
                ),
              ),
            )),
      ],
    );
  }
}
