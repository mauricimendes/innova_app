import 'package:flutter/material.dart';
import 'package:innova_app/components/drawer.dart';
import 'package:innova_app/components/filter.dart';
import 'package:innova_app/components/form_create_task.dart';
import 'package:innova_app/components/header.dart';
import 'package:innova_app/components/task.dart';
import 'package:innova_app/theme/custom_theme.dart';
import 'package:innova_app/pages/modules/task.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ITask>> tasks;
  late String? difficultyState = 'all';
  late DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    tasks = getTasks();
  }

  void newTasks() {
    setState(() {
      tasks = getTasks();
    });
  }

  void nextDay() {
    final DateTime newDate = date.add(const Duration(days: 1));
    setState(() {
      date = newDate;
    });
    newTasks();
  }

  void previousDay() {
    final DateTime newDate = date.add(const Duration(days: -1));
    setState(() {
      date = newDate;
    });
    newTasks();
  }

  String dateTitle() {
    final today = DateFormat("yyyy-MM-dd").format(DateTime.now());
    if (today == DateFormat("yyyy-MM-dd").format(date)) {
      return 'Tarefas de hoje';
    } else {
      return DateFormat("dd/MM/yyyy").format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
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
                        date: dateTitle(),
                        handleNextDay: () => nextDay(),
                        handlePreviousDay: () => previousDay(),
                        openDrawer: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    })),
                Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Filter(
                      handleChangeDifficulty: (difficulty) {
                        setState(() {
                          if (difficultyState == difficulty) {
                            difficultyState = 'all';
                          } else {
                            difficultyState = difficulty;
                          }
                        });
                        newTasks();
                      },
                    )),
                const SizedBox(height: 24),
              ],
            )),
        body: FutureBuilder<List<ITask>>(
            future: tasks,
            builder: (context, mytasks) {
              if (mytasks.hasData && mytasks.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: mytasks.data!.length,
                    itemBuilder: (items, index) {
                      ITask task = mytasks.data![index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Task(
                          handleDeleteTask: () {
                            deleteTask(task.id ?? '');
                            setState(() {
                              late List<ITask> list = tasks as List<ITask>;
                              list.removeWhere((item) => item.id == task.id);
                              setState(() {
                                tasks = list as Future<List<ITask>>;
                              });
                            });
                          },
                          handleCheckedTask: () => checkedTaks(task.id ?? ''),
                          title: task.title ?? '',
                          checked: task.checked ?? false,
                          description: task.description ?? '',
                          difficulty: task.difficulty ?? '',
                        ),
                      );
                    });
              } else {
                return Center(
                    child: DefaultTextStyle(
                        style: TextStyle(
                            color: theme.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        child: const Text('Não há tarefas')));
              }
            }),
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
    var dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss").format(date);

    final response = await api.get('http://192.168.100.7:3000/tasks',
        queryParameters: {
          'date': dateFormatted,
          'difficulty': difficultyState
        });

    final list =
        (response.data as List).map((task) => ITask.fromJson(task)).toList();

    return list;
  }

  void checkedTaks(String id) async {
    final api = Dio();
    await api.patch('http://192.168.100.7:3000/tasks/$id');
    newTasks();
  }

  void deleteTask(String id) async {
    final api = Dio();
    await api.delete('http://192.168.100.7:3000/tasks/$id');
  }
}
