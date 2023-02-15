import 'package:dio/dio.dart';
import 'package:innova_app/modules/tasks/data/datasources/task_datasources.dart';
import 'package:innova_app/modules/tasks/data/model/get_task_model.dart';

class Api implements TaskDataSource {
  final Dio dio;

  Api(this.dio);

  @override
  Future<List<GetTaskModel>> getTasks(
      String? email, String? date, String? difficulty) async {
    final response =
        await dio.get('http://localhost:3333/tasks', queryParameters: {});

    final list =
        (response.data).map((task) => GetTaskModel.fromJson(task)).toList();

    return list;
  }
}
