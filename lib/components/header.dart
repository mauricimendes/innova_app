import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Header extends StatelessWidget {
  final Function openDrawer;
  const Header({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Ink(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              color: theme.container, borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: () {
              openDrawer();
            },
            borderRadius: BorderRadius.circular(8),
            child: Icon(
              Icons.menu,
              color: theme.secondary,
            ),
          ),
        ),
        DefaultTextStyle(
            style: TextStyle(
                color: theme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            child: const Text('Tarefas de hoje')),
        Row(
          children: [
            Ink(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  color: theme.container,
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: theme.secondary,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Ink(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  color: theme.container,
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: theme.secondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
