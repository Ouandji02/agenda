import 'package:flutter/material.dart';

class WidgetDetailTask extends StatelessWidget {
  const WidgetDetailTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .56,
      width: size.width * .95,
      constraints: BoxConstraints(minHeight: size.height * .55),
      padding: EdgeInsets.only(
          top: size.width * .15, left: 20, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: Offset(3, 5),
              color: Colors.black.withOpacity(.1),
              blurRadius: 30)
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text("F"),
                radius: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Titre de la tache",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Commence a 18h",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * .2,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  width: size.width * .2,
                  child: Divider(
                    thickness: 2,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text(
                "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilis??e ?? titre provisoire pour calibrer une mise en page, le texte d??finitif venant remplacer le faux-texte d??s qu'il est pr??t ou que la mise en page est achev??e., le Lorem ipsum ou Lipsum."),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 20)
              ],
            ),
            margin: EdgeInsets.only(top: 20, bottom: 5),
            width: size.width * .9,
            height: 5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.black.withOpacity(.4),
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
              value: 0.6,
            ),
          ),
          Container(
            width: size.width * .9,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("0%"),
                Text(
                  "60%",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
          Container(
            width: size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.timer,
                            color: Colors.white,
                            size: size.width * .07,
                            shadows: [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: Colors.black.withOpacity(.2),
                                  blurRadius: 50)
                            ]),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Debut",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              "18h00",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.timer_off,
                          size: size.width * .07,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 50)
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Final",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              "18h00",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
