import 'package:flutter_application_1/modeles/Task.dart';
import 'package:floor/floor.dart';
import 'package:flutter_application_1/DAO/taskDao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version:1, entities:[Task])
abstract class TaskDatabase extends FloorDatabase {
   TaskDao get taskDao;
}

