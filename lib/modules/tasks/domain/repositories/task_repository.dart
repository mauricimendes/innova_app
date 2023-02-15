import 'package:innova_app/modules/tasks/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTask(String? email, String? date, String? difficulty);
}
