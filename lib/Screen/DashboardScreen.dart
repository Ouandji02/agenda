import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Chips.dart';
import 'package:flutter_application_1/constants/Colors.dart';
import 'package:flutter_application_1/widgets/WidgetAppBar.dart';
import 'package:flutter_application_1/widgets/WidgetCreateTask.dart';
import 'package:flutter_application_1/widgets/WidgetDrawer.dart';
import 'package:flutter_application_1/widgets/WidgetTask.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  String? selectChips = "Mercredi";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: GlobalDrawer(),
      body: Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            WidgetCreateTask(),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
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
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      onSelected: (onSelcted) {
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return WidgetTask();
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
