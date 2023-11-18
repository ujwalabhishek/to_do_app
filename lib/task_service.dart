import 'package:dio/dio.dart';
import 'package:to_do_app/task_model.dart';

class TaskService {
  final Dio dio = Dio();
  final String applicationId = 'yjSVoYCeFF3gTLkbEsFsJXjYH3WnYn8ywLQbBI9X';
  final String clientKey = '22t1HsK79VBEMgGFghczswjMwVCzf2zZywKKwV8y';
  final String apiUrl = 'https://parseapi.back4app.com/classes/Task';

  Future<List<Task>> getTasks() async {
    try {
      final response = await dio.get(
        '$apiUrl',
        options: Options(
          headers: {
            'X-Parse-Application-Id': applicationId,
            'X-Parse-Client-Key': clientKey,
          },
        ),
      );

      final List<Task> tasks = (response.data['results'] as List)
          .map((task) => Task.fromJson(task))
          .toList();

      return tasks;
    } catch (e) {
      throw Exception('Failed to load tasks');
    }
  }
  Future<void> saveTask(Task task) async {
    try {
      await dio.post(
        '$apiUrl',
        options: Options(
          headers: {
            'X-Parse-Application-Id': applicationId,
            'X-Parse-Client-Key': clientKey,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'title': task.title,
          'description': task.description,
          'isCompleted': task.isCompleted,
        },
      );
    } catch (e) {
      throw Exception('Failed to save task');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await dio.put(
        '$apiUrl/${task.objectId}',
        options: Options(
          headers: {
            'X-Parse-Application-Id': applicationId,
            'X-Parse-Client-Key': clientKey,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'title': task.title,
          'description': task.description,
          'isCompleted': task.isCompleted,
        },
      );
    } catch (e) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await dio.delete(
        '$apiUrl/${task.objectId}',
        options: Options(
          headers: {
            'X-Parse-Application-Id': applicationId,
            'X-Parse-Client-Key': clientKey,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'title': task.title,
          'description': task.description,
          'isCompleted': task.isCompleted,
        },
      );
    } catch (e) {
      throw Exception('Failed to update task');
    }
  }

}

