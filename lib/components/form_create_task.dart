import 'package:flutter/material.dart';
import 'package:innova_app/components/filter.dart';
import 'package:innova_app/components/filter_button.dart';
import 'package:innova_app/components/input_app.dart';
import 'package:innova_app/theme/custom_theme.dart';

class FormCreateTask extends StatelessWidget {
  const FormCreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Container(
      height: 388,
      width: double.infinity,
      color: theme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 36,
              decoration: BoxDecoration(
                  color: theme.secondary,
                  borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(
              height: 24,
            ),
            const InputApp(
              placeholder: 'Título',
            ),
            const SizedBox(
              height: 16,
            ),
            const InputApp(
              placeholder: 'Descrição',
              textArea: true,
            ),
            const SizedBox(
              height: 16,
            ),
            const Filter(),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: theme.brand, borderRadius: BorderRadius.circular(8)),
              child: Ink(
                child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              color: theme.primary,
                              fontWeight: FontWeight.bold),
                          child: const Text('SALVAR')),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
