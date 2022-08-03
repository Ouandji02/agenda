import 'package:flutter/material.dart';

class WidgetCreateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: OutlinedButton(
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          alignment: AlignmentDirectional.topStart,
          decoration:
              BoxDecoration(color: Theme.of(context).accentColor, boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.8),
                blurRadius: 10)
          ]),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Center(
                child: Text(
                  "Creer un tache",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
