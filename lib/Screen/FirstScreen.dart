import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Widget_Text_First_Screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  TabBarView(
                    children: [
                      WidgetTextFirstScreen(
                        description:
                        "Gest un gestionnaire dans lequel on enregistre ces taches pour une meilleure organisation ",
                        title: "C'est quoi Gest ? ",
                      ),
                      WidgetTextFirstScreen(
                        description:
                        "Grace a cela vous pourrez verifier vos taches quelque soit l'appareil pres de vous et votre position ",
                        title:
                        'Conservez vos taches en ligne a chaque instant',
                      ),
                      WidgetTextFirstScreen(
                        description:
                        "Grace a cela vous pourrez verifier vos taches quelque soit l'appareil pres de vous et votre position ",
                        title:
                        'Conservez vos taches en ligne a chaque instant',
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    constraints: BoxConstraints(minHeight: size.height * .35),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 40,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
