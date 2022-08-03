import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/WidgetAppBar.dart';
import 'package:flutter_application_1/widgets/WidgetCreateTask.dart';
import 'package:flutter_application_1/widgets/WidgetDrawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: GlobalAppBar("Dasboard", context),
      drawer: GlobalDrawer(),
      body: SingleChildScrollView(
        child: Container(
          alignment: AlignmentDirectional.topStart,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  "Bienvenue a toi, Comment allez-vous aujourd'hui ?",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              WidgetCreateTask(),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  "Liste des taches",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              WidgetCreateTask()
            ],
          ),
        ),
      ),
    );
  }
}
