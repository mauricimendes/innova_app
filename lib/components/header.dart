import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Header extends StatelessWidget {
  final VoidCallback openDrawer;
  final VoidCallback handleNextDay;
  final VoidCallback handlePreviousDay;
  final String date;
  const Header(
      {super.key,
      required this.date,
      required this.openDrawer,
      required this.handleNextDay,
      required this.handlePreviousDay});

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
            child: Text(date)),
        Row(
          children: [
            Ink(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  color: theme.container,
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () => handlePreviousDay(),
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
                onTap: () => handleNextDay(),
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
