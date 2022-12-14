import 'package:flutter/material.dart';
import 'package:flutter_application_1/modeles/Task.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:provider/provider.dart';

class WidgetModalForm extends StatefulWidget {
  const WidgetModalForm({Key? key}) : super(key: key);

  @override
  State<WidgetModalForm> createState() => _WidgetModalFormState();
}

class _WidgetModalFormState extends State<WidgetModalForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  TimeOfDay? beginDateController;
  TimeOfDay? endDateController;
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    final taskProvidder = Provider.of<TaskProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Center(
                      child: Text(
                        "Creer une tache",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextFormField(
                            controller: taskController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.task),
                              hintText: "Entrez votre tache",
                              labelText: "Votre tache",
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return "s'il vous plait entrer votre tache";
                              return null;
                            },
                          ),
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 0, minute: 0));
                              print("sdffffffffffffff ${pickedTime}");
                              setState(() {
                                beginDateController = pickedTime!;
                              });
                            },
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.access_time_outlined),
                              hintText: beginDateController != null
                                  ? "${beginDateController!.hour}:${beginDateController!.minute}"
                                  : "00:00",
                            ),
                            validator: (value) {
                              if (beginDateController == null) {
                                return "s'il vous plait entrez l'heure";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 0, minute: 0));
                              print("sdffffffffffffff ${pickedTime}");
                              setState(() {
                                endDateController = pickedTime;
                              });
                            },
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.timer_off_sharp),
                              hintText: endDateController != null
                                  ? "${endDateController!.hour}:${endDateController!.minute}"
                                  : "00:00",
                            ),
                            validator: (value) {
                              if (endDateController == null) {
                                return "s'il vous plait entrez l'heure";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            maxLines: 5,
                            textAlignVertical: TextAlignVertical.top,
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: "   Votre Description....",
                                hintStyle: TextStyle()),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                Size(size.width * .3, 40),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  endDateController != null &&
                                  beginDateController != null) {
                                taskProvidder.setTask(Task(
                                    title: taskController.text,
                                    dateBegin: beginDateController,
                                    dateEnd: endDateController,
                                    message: descriptionController.text,
                                    dateTime: DateTime.now()));

                                var sn = SnackBar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  content: Text("tache creee"),
                                );
                              }
                            },
                            child: const Text(
                              "Creer",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
