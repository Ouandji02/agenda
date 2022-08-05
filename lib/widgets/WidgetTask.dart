import 'package:flutter/material.dart';

class WidgetTask extends StatefulWidget {
  @override
  _WidgetTask createState() {
    // TODO: implement createState
    return _WidgetTask();
  }
}

class _WidgetTask extends State<WidgetTask> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.03),
                  blurRadius: 40,
                  offset: Offset(0, 5)),
              BoxShadow(
                  color: Colors.black.withOpacity(.03),
                  blurRadius: 50,
                  offset: Offset(0, -10))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text("F"),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Titre de la tache",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    width: size.width * .7,
                    child: Row(
                      children: [
                        Text(
                          "En cours",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Spacer(),
                        Text("18h - 20h")
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 20
                        )
                      ]
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: size.width * .7,
                    height: 5,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black.withOpacity(.4),
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                      value: 0.6,
                    ),
                  ),
                  Container(
                    width: size.width * .7,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.date_range_outlined),
                              Text("Mer 22 jan 2022",
                                  style: Theme.of(context).textTheme.subtitle2),
                            ],
                          ),
                        ),
                        Text(
                          "60%",
                          style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).accentColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
