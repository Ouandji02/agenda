import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database.dart';

import '../modeles/Task.dart';

class DatabaseProvider with ChangeNotifier {
  late TaskDatabase database;

  void manageDatabase() async {
    database =
        await $FloorTaskDatabase.databaseBuilder("task_database").build();
  }
}
