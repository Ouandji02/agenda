import 'package:flutter/material.dart';

List LIST_ITEM = [
  {"text": "Home", "icon": Icons.home_outlined, "route": "/"},
  {"text": "Liste des taches", "icon": Icons.folder_copy_outlined, "route": "/tache"},
  {"text": "Settings", "icon": Icons.settings_rounded, "route": "/settings"},
  {"text": "Deconnexion", "icon": Icons.login_outlined, "route": "/login"},
];

class GlobalDrawer extends StatefulWidget {
  @override
  _GlobalDrawer createState() {
    // TODO: implement createState
    return _GlobalDrawer();
  }
}

class _GlobalDrawer extends State<GlobalDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      width: MediaQuery.of(context).size.width * .85,
      elevation: 2,
      child: Container(
        child: Column(
          children: [
            UserHeaderDrawer(nom: "John Doe", email: "XXXXXX@gmail.com"),
            Expanded(
                child: ListView.builder(
                    itemCount: LIST_ITEM.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(LIST_ITEM.length);
                      return MenuList(
                          text: LIST_ITEM[index]['text'],
                          icon: LIST_ITEM[index]['icon'],
                          route: LIST_ITEM[index]['route'],
                          context: context);
                    }))
          ],
        ),
      ),
    );
  }
}

class UserHeaderDrawer extends StatelessWidget {
  String? nom;
  String? email;

  UserHeaderDrawer({Key? key, required this.nom, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      padding: EdgeInsets.only(left: 5, top: 35, bottom: 20),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              children: const [
                Text(
                  "JOHN DOE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text("xxxxxxx@gmail.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ],
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

Widget MenuList(
    {required text,
    required icon,
    required route,
    required BuildContext context}) {
  const color = Colors.white;
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
    ),
    title: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
    onTap: () => Navigator.pushNamed(context, route),
  );
}
