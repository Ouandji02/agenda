import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.palette_outlined,
                color: Colors.white,
              ),
            ),
            title: Text("Theme"),
            subtitle: Text("light theme"),
            trailing: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black.withOpacity(.4),
                )),
          )
        ],
      ),
    );
  }
}
