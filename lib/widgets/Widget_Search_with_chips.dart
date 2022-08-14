import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Chips.dart';
import '../constants/Colors.dart';

class WidgetSearchWithChips extends StatefulWidget {
  late String selectChips;
  late int index;

  WidgetSearchWithChips(
      {Key? key, required this.selectChips, required this.index})
      : super(key: key);

  @override
  State<WidgetSearchWithChips> createState() => _WidgetSearchWithChipsState(
      selectChips: this.selectChips, index: this.index);
}

class _WidgetSearchWithChipsState extends State<WidgetSearchWithChips> {
  late String? selectChips;
  late int index;

  _WidgetSearchWithChipsState({required this.selectChips, required this.index});

  @override
  Widget build(BuildContext context) {
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
            color: CHIPS_LIST[index] == selectChips ? Colors.white : COLOR_TEXT,
            fontSize: 18),
        disabledColor: Colors.white,
        selectedColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
      ),
    );
  }
}

chips(String? selectChips, int index, BuildContext context) => Container(
      margin: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        onSelected: (onSelected) {
          selectChips = CHIPS_LIST[index];
        },
        label: Text(CHIPS_LIST[index]),
        backgroundColor: Colors.white,
        selected: CHIPS_LIST[index] == selectChips,
        elevation: 3,
        labelStyle: TextStyle(
            color: CHIPS_LIST[index] == selectChips ? Colors.white : COLOR_TEXT,
            fontSize: 18),
        disabledColor: Colors.white,
        selectedColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
      ),
    );
