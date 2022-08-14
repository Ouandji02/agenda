import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../functions/filterTask.dart';
import '../functions/manageTime.dart';
import '../modeles/Task.dart';

class WidgetTask extends StatefulWidget {
  int? index;
  String? selectChips;

  WidgetTask({required this.index, required this.selectChips});

  @override
  _WidgetTask createState() {
    // TODO: implement createState
    return _WidgetTask(
      index: index,
      selectChips: selectChips,
    );
  }
}

class _WidgetTask extends State<WidgetTask> {
  int? index;
  String? selectChips;

  _WidgetTask({required this.index, required this.selectChips});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    Task? indexTask = filterTask(
        selectChips, context.watch<TaskProvider>().task, context)[index!];
    ;
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "/details", arguments: indexTask),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
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
                      child: Text(
                        taskProvider.task[this.index!].title
                            .toString()
                            .substring(0, 2),
                      ),
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
                          indexTask!.title.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Container(
                          width: size.width * .65,
                          child: Row(
                            children: [
                              Text(
                                getStatus(indexTask.dateBegin, TimeOfDay.now(),
                                    indexTask.dateEnd),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Spacer(),
                              Text(
                                  "${(indexTask.dateBegin!.hour.toString() + ":" + indexTask.dateBegin!.minute.toString()).toString()} - ${(indexTask.dateEnd!.hour.toString() + ":" + indexTask.dateEnd!.minute.toString())}",
                                  style: Theme.of(context).textTheme.subtitle2)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 20)
                          ]),
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: size.width * .65,
                          height: 5,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.black.withOpacity(.4),
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                            value: (getDiffHours(
                                    TimeOfDay.now(), indexTask.dateBegin) /
                                getDiffHours(
                                    indexTask.dateEnd, indexTask.dateBegin)),
                          ),
                        ),
                        Container(
                          width: size.width * .65,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range_outlined),
                                    Text("${indexTask.dateSave}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                  ],
                                ),
                              ),
                              Text(
                                "${getPercent(TimeOfDay.now(), indexTask.dateBegin, indexTask.dateEnd)} %",
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
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: size.height * .1,
                width: size.width * .03,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-2, -1),
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 30)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
