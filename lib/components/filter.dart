import 'package:flutter/material.dart';
import 'package:innova_app/components/filter_button.dart';

class Filter extends StatefulWidget {
  final void Function(String) handleChangeDifficulty;
  const Filter({super.key, required this.handleChangeDifficulty});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int? buttonSelected;

  handleSelectedButton(int keyButton) {
    setState(() {
      if (buttonSelected == keyButton) {
        buttonSelected = null;
      } else {
        buttonSelected = keyButton;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButton(
            selected: buttonSelected == 0 ? true : false,
            onPressed: () {
              handleSelectedButton(0);
              widget.handleChangeDifficulty('easy');
            },
            title: 'fácil'),
        const SizedBox(
          width: 16,
        ),
        FilterButton(
            selected: buttonSelected == 1 ? true : false,
            onPressed: () {
              handleSelectedButton(1);
              widget.handleChangeDifficulty('medium');
            },
            title: 'médio'),
        const SizedBox(
          width: 16,
        ),
        FilterButton(
            selected: buttonSelected == 2 ? true : false,
            onPressed: () {
              handleSelectedButton(2);
              widget.handleChangeDifficulty('hard');
            },
            title: 'difícil')
      ],
    );
  }
}
