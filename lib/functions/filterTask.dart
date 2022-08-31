import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modeles/Task.dart';
import '../provider/Task_Provider.dart';

List<Task>? filterTask(
    String? selectChips, List<Task>? tasks, BuildContext context) {
  return !selectChips!.contains('Tout')
      ? context
          .watch<TaskProvider>()
          .task
          ?.where((element) => element.dateSave.contains(selectChips!))
          .toList()
      : context.watch<TaskProvider>().task;
}
