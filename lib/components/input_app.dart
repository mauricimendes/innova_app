import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class InputApp extends StatelessWidget {
  final String placeholder;
  final bool? textArea;
  const InputApp({super.key, this.textArea = false, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return TextField(
      maxLines: textArea! ? 3 : 1,
      obscureText: false,
      style: TextStyle(color: theme.primary),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          filled: true,
          fillColor: theme.container,
          hintText: placeholder,
          hintStyle:
              TextStyle(color: theme.background, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.container)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.brand, width: 2))),
    );
  }
}
