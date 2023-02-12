import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _checked = false;
  bool _open = false;
  double _sizeTask = 62;

  handleSetChecked() {
    setState(() {
      _checked = !_checked;
    });
  }

  handleOpenTask() {
    const double sizeOpenTask = 128;

    setState(() {
      _sizeTask = _sizeTask == sizeOpenTask ? 62 : sizeOpenTask;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _open = !_open;
      });
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
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: theme.container, borderRadius: BorderRadius.circular(8)),
          height: _sizeTask,
          width: double.infinity,
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onDoubleTap: handleOpenTask,
            onLongPress: () => handleSetChecked(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
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
                Visibility(
                  visible: _open,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: DefaultTextStyle(
                        style: TextStyle(color: theme.secondary),
                        child: const Text(
                            'Aqui vai um texto grande que vai ser a descrição da terafa que sera realizada.')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
