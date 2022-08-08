import 'package:flutter/material.dart';

class WidgetStatusTak extends StatelessWidget {
  late String title;
  late IconData icon;

  WidgetStatusTak({
    required this.title,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 3),
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10)
                ]),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                child: Icon(
                  this.icon,
                  color: Colors.white,
                ),
              ),
              title: Text(this.title),
              subtitle: Text("Statut"),
              trailing: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black.withOpacity(.4),
                  )),
            ),
          ),
          Positioned(
            top: 15,
            child: Container(
              height: 40,
              width: 10,
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
          )
        ],
      ),
    );
  }
}
