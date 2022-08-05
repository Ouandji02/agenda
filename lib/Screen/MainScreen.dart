import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/DashboardScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() {
    // TODO: implement createState
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ))
            ],
            title: Text(
              "Gest",
              style: GoogleFonts.pacifico(fontSize: 30),
            ),
            automaticallyImplyLeading: false,
            bottom: TabBar(tabs: [
              Tab(
                text: "Accueil",
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                text: "Taches",
                icon: Icon(Icons.folder_copy_outlined),
              ),
              Tab(
                text: "Settings",
                icon: Icon(Icons.settings_applications_outlined),
              )
            ]),
          ),
          body: TabBarView(children: [
            Dashboard(),
            Center(
              child: Text("Taches"),
            ),
            Center(
              child: Text("settings"),
            )
          ]),
        ));
  }
}
