import 'package:flutter/material.dart';
import 'package:innova_app/components/drawer.dart';
import 'package:innova_app/components/filter.dart';
import 'package:innova_app/components/header.dart';
import 'package:innova_app/components/task.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

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
                    child: Builder(builder: (context) {
                      return Header(
                        openDrawer: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    })),
                const Padding(
                    padding: EdgeInsets.only(left: 24), child: Filter()),
                const SizedBox(height: 24),
              ],
            )),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (items, index) => const Task()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.brand,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 24,
            color: theme.secondary,
          ),
        ),
        drawer: const DrawerApp());
  }
}
