import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Task extends StatefulWidget {
  final String title;
  final String description;
  final String difficulty;
  final VoidCallback handleCheckedTask;
  final VoidCallback handleDeleteTask;
  final bool checked;

  const Task(
      {super.key,
      required this.title,
      required this.checked,
      required this.description,
      required this.difficulty,
      required this.handleCheckedTask,
      required this.handleDeleteTask});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _checked = false;
  bool _open = false;
  double _sizeTask = 62;

  @override
  void initState() {
    super.initState();
    setState(() {
      _checked = widget.checked;
    });
  }

  handleSetChecked() {
    setState(() {
      _checked = !_checked;
    });
    widget.handleCheckedTask();
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
        onDismissed: (direction) => {widget.handleDeleteTask()},
        key: Key(''),
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: theme.container, borderRadius: BorderRadius.circular(8)),
          height: _sizeTask,
          width: double.infinity,
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onDoubleTap: handleOpenTask,
            onLongPress: () => handleSetChecked(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Text(widget.title)),
                          ]),
                      DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.difficulty == 'easy'
                                  ? theme.green
                                  : widget.difficulty == 'medium'
                                      ? theme.orange
                                      : theme.red),
                          child: Text(widget.difficulty == 'easy'
                              ? 'Fácil'
                              : widget.difficulty == 'medium'
                                  ? 'Médio'
                                  : 'Difícil'))
                    ],
                  ),
                ),
                Visibility(
                  visible: _open,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: DefaultTextStyle(
                        style: TextStyle(color: theme.secondary),
                        child: Text(widget.description)),
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
