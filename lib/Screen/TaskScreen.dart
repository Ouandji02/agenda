import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:provider/provider.dart';

import '../constants/Chips.dart';
import '../constants/Colors.dart';
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
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    onSelected: (onSelected) {
                      setState(() {
                        selectChips = CHIPS_LIST[index];
                      });
                    },
                    label: Text(CHIPS_LIST[index]),
                    backgroundColor: Colors.white,
                    selected: CHIPS_LIST[index] == selectChips,
                    elevation: 3,
                    labelStyle: TextStyle(
                        color: CHIPS_LIST[index] == selectChips
                            ? Colors.white
                            : COLOR_TEXT,
                        fontSize: 18),
                    disabledColor: Colors.white,
                    selectedColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(5),
                  ),
                );
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
