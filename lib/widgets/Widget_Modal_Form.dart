import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/Colors.dart';

class WidgetModalForm extends StatefulWidget {
  const WidgetModalForm({Key? key}) : super(key: key);

  @override
  State<WidgetModalForm> createState() => _WidgetModalFormState();
}

class _WidgetModalFormState extends State<WidgetModalForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
                  margin: EdgeInsets.only(bottom: 20),
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                        margin: EdgeInsets.only(top: 10, bottom: 5),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 15),
                        child: TextFormField(
                          controller: beginDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.hourglass_top_outlined),
                            hintText: "Entrez l'heure de debut",
                            labelText: "Heure de debut",
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return "s'il vous plait entrez l'heure";
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 15),
                        child: TextFormField(
                          controller: endDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.hourglass_bottom_outlined),
                            hintText: "Entrer l'heure de fin",
                            labelText: "Heure de fin",
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return "s'il vous plait entrez l'heure";
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 15),
                        child: TextFormField(
                          maxLines: 5,
                          textAlignVertical: TextAlignVertical.top,
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: "Votre Description....",
                            hintStyle: TextStyle()
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "please enter a email";
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
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/dashboard');
                              print(emailController.text +
                                  beginDateController.text);
                            }
                          },
                          child: Text(
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
    );
  }
}
