import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Task> fromMapJson(str) =>
    List<Task>.from(str.map((task) => Task.fromJson(task)));

class Task {
  late String title;
  late TimeOfDay? dateBegin;
  late TimeOfDay? dateEnd;
  late String dateSave;
  late String? message;

  Task({
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
  }
}
