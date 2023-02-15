import 'package:innova_app/modules/tasks/domain/entities/task.dart';
import 'package:innova_app/modules/tasks/domain/repositories/task_repository.dart';

abstract class GetTasks {
  Future<List<Task>> call(String email, String date, String difficulty);
}

class GetTasksImpl implements GetTasks {
  final TaskRepository taskRepository;

  GetTasksImpl(this.taskRepository);

  @override
  Future<List<Task>> call(
      String? email, String? date, String? difficulty) async {
    return taskRepository.getTask(null, null, null);
  }
}
