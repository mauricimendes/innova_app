import 'package:innova_app/modules/tasks/data/datasources/task_datasources.dart';
import 'package:innova_app/modules/tasks/domain/entities/task.dart';
import 'package:innova_app/modules/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource taskDataSource;

  TaskRepositoryImpl(this.taskDataSource);

  @override
  Future<List<Task>> getTask(
      String? email, String? date, String? difficulty) async {
    final result = await taskDataSource.getTasks(email, date, difficulty);
    return result;
  }
}
