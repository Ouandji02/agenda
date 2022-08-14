import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:provider/provider.dart';

import '../constants/Chips.dart';
import '../widgets/WidgetTask.dart';
import '../widgets/Widget_Search_with_chips.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? selectChips = "Mercredi";

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                print(selectChips);
                return WidgetSearchWithChips(
                    selectChips: selectChips, index: index);
              },
              itemCount: CHIPS_LIST.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [Text("Rechercher par statut :"), Text("Termine")],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return WidgetTask(
                  index: index,
                );
              },
              itemCount: taskProvider.task.length,
            ),
          ),
        ],
      ),
    );
  }
}
