import 'package:flutter/material.dart';

class PickDate {
  static Future<DateTime?> pickDateView({
    required Color color,
    required BuildContext context,
    DateTime? firstDate,
  }) {
    final kLastDay = DateTime(
        DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFFFF8E1),
        100: const Color(0xFFFFECB3),
        200: const Color(0xFFFFE082),
        300: const Color(0xFFFFD54F),
        400: const Color(0xFFFFCA28),
        500: color,
        600: const Color(0xFFFFB300),
        700: const Color(0xFFFFA000),
        800: const Color(0xFFFF8F00),
        900: const Color(0xFFFF6F00),
      },
    );
    return showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            primarySwatch: materialColor,
            // cardColor:  color,
          ),
          child: child ?? const SizedBox(),
        );
      },
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: kLastDay,
    );
  }
}
