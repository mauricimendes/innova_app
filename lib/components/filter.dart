import 'package:flutter/material.dart';
import 'package:innova_app/components/filter_button.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

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
            },
            title: 'fácil'),
        const SizedBox(
          width: 16,
        ),
        FilterButton(
            selected: buttonSelected == 1 ? true : false,
            onPressed: () {
              handleSelectedButton(1);
            },
            title: 'médio'),
        const SizedBox(
          width: 16,
        ),
        FilterButton(
            selected: buttonSelected == 2 ? true : false,
            onPressed: () {
              handleSelectedButton(2);
            },
            title: 'difícil')
      ],
    );
  }
}
