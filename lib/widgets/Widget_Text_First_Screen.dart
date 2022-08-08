import 'package:flutter/material.dart';

class WidgetTextFirstScreen extends StatelessWidget {
  late String title;
  late String description;

  WidgetTextFirstScreen(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            " ${this.title}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "${this.description}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}
