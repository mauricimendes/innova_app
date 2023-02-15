import 'package:flutter/material.dart';
import 'package:innova_app/components/drawer.dart';
import 'package:innova_app/components/filter.dart';
import 'package:innova_app/components/form_create_task.dart';
import 'package:innova_app/components/header.dart';
import 'package:innova_app/components/task.dart';
import 'package:innova_app/theme/custom_theme.dart';
import 'package:innova_app/pages/modules/task.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ITask>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

    return Scaffold(
        backgroundColor: theme.background,
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 182),
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
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const FormCreateTask(),
                    ),
                  );
                });
          },
          child: Icon(
            Icons.add,
            size: 24,
            color: theme.secondary,
          ),
        ),
        drawer: const DrawerApp());
  }

  Future<List<ITask>> getTasks() async {
    final api = Dio();
    final response = await api.get(
        'http://localhost:3000/tasks/mauricimendes.14@gmail.com',
        queryParameters: {
          'date': DateTime.now(),
        });

    final list =
        (response.data as List).map((task) => ITask.fromJson(task)).toList();

    print(list);
    return list;
  }
}
