import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Colors.dart';
import 'package:flutter_application_1/widgets/Widget_Modal_Form.dart';

class WidgetCreateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: DottedBorder(
        color: Colors.black.withOpacity(.4),
        borderType: BorderType.Rect,
        strokeWidth: 2,
        dashPattern: [10, 10, 10, 10],
        child: OutlinedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(side: BorderSide.none),
              ),
              side: MaterialStateProperty.all(BorderSide.none)),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              builder: (context) => WidgetModalForm(),
            );
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15, right: 10),
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                alignment: AlignmentDirectional.topStart,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Creer une nouvelle tache",
                  style: TextStyle(
                    color: COLOR_TEXT.withOpacity(.8),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
