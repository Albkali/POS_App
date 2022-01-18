import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'constants/app_constants.dart';


// Common Date Picker
Future<DateTime?> pickDate(
    {required BuildContext context,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate}) async {
  final picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(DateTime.now().year + AppConstant.lastYear),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
          const ColorScheme.light().copyWith(primary: AppColor.primaryColor),
        ),
        child: child!,
      );
    },
  );
  return picked ?? initialDate;
}
