import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/DashboardScreen.dart';
import 'package:flutter_application_1/Screen/Settings_Screen.dart';
import 'package:flutter_application_1/Screen/TaskScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearch(),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text("Deconnexion")
                    ],
                  ),
                ),
              ],
            )
          ],
          title: Text(
            "Gest",
            style: GoogleFonts.pacifico(fontSize: 30),
          ),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
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
            ],
          ),
        ),
        body: TabBarView(
          children: [Dashboard(), TaskScreen(), SettingsScreen()],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("data");
  }
}
