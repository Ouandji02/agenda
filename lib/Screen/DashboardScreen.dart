import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Chips.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:flutter_application_1/widgets/WidgetCreateTask.dart';
import 'package:flutter_application_1/widgets/WidgetDrawer.dart';
import 'package:flutter_application_1/widgets/WidgetTask.dart';
import 'package:flutter_application_1/widgets/Widget_Search_with_chips.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  String selectChips = "Mercredi";

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
                  return WidgetSearchWithChips(
                      selectChips: selectChips, index: index);
                },
                itemCount: CHIPS_LIST.length,
                scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}
