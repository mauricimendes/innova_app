import 'package:flutter/material.dart';
import 'package:innova_app/theme/custom_theme.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(
      {super.key,
      required this.selected,
      required this.onPressed,
      required this.title});

  final bool selected;
  final String title;
  final VoidCallback? onPressed;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  late final MaterialStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = MaterialStatesController(
        <MaterialState>{if (widget.selected) MaterialState.selected});
  }

  @override
  void didUpdateWidget(FilterButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      statesController.update(MaterialState.selected, widget.selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return theme.primary;
              }
              return theme.secondary; // defer to the defaults
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return widget.title == 'fácil'
                    ? theme.green
                    : widget.title == 'médio'
                        ? theme.orange
                        : theme.red;
              }
              return theme.container; // defer to the defaults
            },
          ),
        ),
        statesController: statesController,
        onPressed: widget.onPressed,
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}
