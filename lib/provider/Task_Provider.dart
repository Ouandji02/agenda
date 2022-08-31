import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/API_SERVICES.dart';

import '../database/database.dart';
import '../modeles/Task.dart';

class TaskProvider with ChangeNotifier {
  List<Task>? _tasks = [];
  TaskDatabase? database;

  List<Task>? get task => _tasks;

  Future<void> setTask(Task tasks) async {
    _tasks?.add(tasks);
    database?.taskDao.inserTask(tasks);
    notifyListeners();
  }

  Future<void> getAllTask() async {
    try {
      database =
      await $FloorTaskDatabase.databaseBuilder("task_databse.db").build();
      print(database?.database);
      _tasks = await database?.taskDao.getTasks() ?? [];
      print(_tasks);
      notifyListeners();
    } catch (e) {
      throw Error();
    }
  }
}
