import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  late final bool isActive;

  Indicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 22.0 : 8.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(milliseconds: 350),
    );
  }
}