import 'package:flutter/material.dart';
import 'package:innova_app/components/filter.dart';
import 'package:innova_app/components/header.dart';
import 'package:innova_app/components/task.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: theme.background,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 174),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.only(
                    left: 24, top: 36, right: 24, bottom: 36),
                child: const Header(),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 24), child: Filter()),
              const SizedBox(height: 24),
            ],
          )),
      body: ListView.builder(itemBuilder: (context, index) => const Task()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.brand,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 24,
          color: theme.secondary,
        ),
      ),
    );
  }
}
