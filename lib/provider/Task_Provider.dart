import 'package:flutter/material.dart';

import '../modeles/Task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get task => _tasks;

  void setTask(Task tasks) {
    _tasks.add(tasks);
    notifyListeners();
  }
}
