import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _checked = false;

  handleSetChecked() {
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Dismissible(
        background: Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                color: theme.secondary,
              )
            ],
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => {print('teste')},
        key: Key(''),
        child: Container(
          decoration: BoxDecoration(
              color: theme.container, borderRadius: BorderRadius.circular(8)),
          height: 62,
          width: double.infinity,
          child: InkWell(
            onLongPress: () => handleSetChecked(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: _checked ? theme.brand : theme.secondary,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                              color: theme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            child: const Text('lavar louças')),
                      ]),
                  DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.green),
                      child: const Text('fácil'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
