import 'package:flutter/material.dart';
import 'package:flutter_application_1/modeles/Task.dart';
import 'package:flutter_application_1/widgets/Widget_Status_Task.dart';
import 'package:flutter_application_1/widgets/Widget_detail_Task.dart';

import '../functions/manageTime.dart';
import '../widgets/Widget_Modal_Form.dart';

class DetailTaskScreen extends StatefulWidget {
  const DetailTaskScreen({Key? key}) : super(key: key);

  @override
  State<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends State<DetailTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                    minHeight: size.height, minWidth: size.width),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: size.height * .5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                      child: Text(
                        "Detail",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 170),
                      child: Column(
                        children: [
                          WidgetStatusTak(
                            title: 'Tache termine',
                            icon: Icons.check_circle_outline,
                          ),
                          WidgetStatusTak(
                            icon: Icons.ac_unit_outlined,
                            title: 'Tache en cours',
                          ),
                          WidgetStatusTak(
                            icon: Icons.browse_gallery_outlined,
                            title: 'Tache en attente',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: size.height * .15,
                left: size.width * .07,
                right: size.width * .07,
                child: WidgetDetailTask(
                  task: args,
                ),
              ),
              Positioned(
                top: size.height * .1,
                left: size.width * .4,
                child: Icon(
                  getIcon(TimeOfDay.now(), args.dateBegin, args.dateEnd),
                  color: Colors.white,
                  size: size.width * .2,
                  shadows: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        blurRadius: 70),
                    BoxShadow(
                        offset: Offset(-5, -5),
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        blurRadius: 70),
                    BoxShadow(
                        offset: Offset(5, -5),
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        blurRadius: 70),
                    BoxShadow(
                        offset: Offset(-5, 5),
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        blurRadius: 70),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            builder: (context) => WidgetModalForm(),
          );
        },
        child: Icon(
          Icons.edit,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                offset: Offset(2, 3),
                blurRadius: 10)
          ],
        ),
      ),
    );
  }
}
