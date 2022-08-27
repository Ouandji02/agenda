import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Task> fromMapJson(str) =>
    List<Task>.from(str.map((task) => Task.fromJson(task)));

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  late int? id;
  late String title;
  late String? dateBegin;
  late String? dateEnd;
  late String dateSave;
  late String message;

  Task({
    this.id,
    required this.title,
    required this.dateBegin,
    required this.dateEnd,
    required this.message,
    required this.dateSave
  });

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dateBegin = json['dateBegin'];
    dateEnd = json['dateEnd'];
    dateSave = json['dateSave'];
    id = json['id'];
  }
}
