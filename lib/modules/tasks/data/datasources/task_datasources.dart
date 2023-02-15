import 'package:innova_app/modules/tasks/data/model/get_task_model.dart';

abstract class TaskDataSource {
  Future<List<GetTaskModel>> getTasks(
      String? email, String? date, String? difficulty) {}
}
