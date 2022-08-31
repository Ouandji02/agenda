import 'package:flutter/material.dart';

import '../DAO/taskDao.dart';
import '../database/database.dart';

class API_SERIVCES {
  static Future<TaskDao> getTaskDatabse() async {
    TaskDatabase database =
        await $FloorTaskDatabase.databaseBuilder("task_databse.db").build();
     return database.taskDao;
  }
}
