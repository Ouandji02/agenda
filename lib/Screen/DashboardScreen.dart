import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Chips.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:flutter_application_1/widgets/WidgetCreateTask.dart';
import 'package:flutter_application_1/widgets/WidgetDrawer.dart';
import 'package:flutter_application_1/widgets/WidgetTask.dart';
import 'package:flutter_application_1/widgets/Widget_Search_with_chips.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/Colors.dart';
import '../functions/filterTask.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  String selectChips = "Tout";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      drawer: GlobalDrawer(),
      body: Container(
        alignment: AlignmentDirectional.topStart,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            WidgetCreateTask(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: AlignmentDirectional.topStart,
              child: const Text(
                "Taches",
                style: TextStyle(fontSize: 22),
              ),
            ),
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
            Expanded(
              child: filterTask(selectChips, context.watch<TaskProvider>().task,
                              context)
                          .length !=
                      0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return WidgetTask(
                          index: index,
                          selectChips: selectChips,
                        );
                      },
                      itemCount: filterTask(selectChips,
                              context.watch<TaskProvider>().task, context)
                          .length,
                    )
                  : Center(
                      child: Text("Aucune Tache pour le moment"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
