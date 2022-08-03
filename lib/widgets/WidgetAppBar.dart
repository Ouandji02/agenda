import 'package:flutter/material.dart';

GlobalAppBar(title, context) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 2,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
  );
}
