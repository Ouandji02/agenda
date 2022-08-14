import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Widget_Text_First_Screen.dart';

import '../constants/PageView.dart';
import '../widgets/Widget_Indicator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int isSelected = 0;

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
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/note1.png"),
                            fit: BoxFit.cover)),
                    height: MediaQuery.of(context).size.height * .55,
                    width: MediaQuery.of(context).size.height * .7,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    constraints: BoxConstraints(minHeight: size.height * .4),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              tabs.length,
                              (index) => Indicator(
                                  isActive: isSelected == index ? true : false),
                            )
                          ],
                        ),
                        Container(
                          height: size.height * .2,
                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                isSelected = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return tabs[index];
                            },
                            itemCount: tabs.length,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: AlignmentDirectional.center,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                Size(size.width * .3, 45),
                              ),
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/login'),
                            child: Text(
                              "Suivant",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
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
