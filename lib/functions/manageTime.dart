import 'package:flutter/material.dart';

int getDiffHours(TimeOfDay? time1, TimeOfDay? time2) {
  return (time1!.hour * 60 + time1.minute) - (time2!.hour * 60 + time2.minute);
}

int getPercent(TimeOfDay? time1, TimeOfDay? time2, TimeOfDay? time3) {
  if (getDiffHours(time1, time2) / getDiffHours(time3, time2) > 1) return 100;
  if (getDiffHours(time1, time2) / getDiffHours(time3, time2) < 0) return 0;
  return ((getDiffHours(time1, time2) / getDiffHours(time3, time2)) * 100)
      .round();
}

String getStatus(TimeOfDay? time1, TimeOfDay? time2, TimeOfDay? time3) {
  if (getDiffHours(time1, time2) > 0) return 'A faire';
  if (getDiffHours(time3, time2) < 0) return 'Termine';
  return "En cours";
}

IconData getIcon(TimeOfDay? time1, TimeOfDay? time2, TimeOfDay? time3) {
  if (getPercent(time1, time2, time3) < 100 &&
      getPercent(time1, time2, time3) > 0) return Icons.ac_unit_outlined;
  if (getPercent(time1, time2, time3) >= 100) return Icons.check_circle_outline;
  return Icons.browse_gallery_outlined;
}
