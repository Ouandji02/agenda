import 'package:flutter/material.dart';

List<Task> fromMapJson(str) =>
    List<Task>.from(str.map((task) => Task.fromJson(task)));

class Task {
  late String title;
  late TimeOfDay? dateBegin;
  late TimeOfDay? dateEnd;
  late DateTime dateTime;
  late String? message;

  Task(
      {required this.title,
      required this.dateBegin,
      required this.dateEnd,
      required this.message,
      required this.dateTime});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dateBegin = json['dateBegin'];
    dateEnd = json['dateEnd'];
    dateTime = json['dateTime'];
  }
}
