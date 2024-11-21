import 'package:flutter/material.dart';

class TimePickerView {
  Future<TimeOfDay?> timePickerView({
    required Color color,
    required BuildContext context,
  }) {
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFE0E0E0),  // Light grayish black
        100: const Color(0xFFBDBDBD), // Grayish black
        200: const Color(0xFF9E9E9E), // Medium grayish black
        300: const Color(0xFF757575), // Dark grayish black
        400: const Color(0xFF616161), // Slightly darker grayish black
        500: color,                  // Original color
        600: const Color(0xFF424242), // Darker black
        700: const Color(0xFF212121), // Very dark black
        800: const Color(0xFF1B1B1B), // Even darker black
        900: const Color(0xFF000000), // Pure black
      },
    );
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
    );
  }
}

class DatePickerView {
  Future<DateTime?> datePickerView({
    required Color color,
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFE0E0E0),  // Light grayish black
        100: const Color(0xFFBDBDBD), // Grayish black
        200: const Color(0xFF9E9E9E), // Medium grayish black
        300: const Color(0xFF757575), // Dark grayish black
        400: const Color(0xFF616161), // Slightly darker grayish black
        500: color,                  // Original color
        600: const Color(0xFF424242), // Darker black
        700: const Color(0xFF212121), // Very dark black
        800: const Color(0xFF1B1B1B), // Even darker black
        900: const Color(0xFF000000), // Pure black
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
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
    );
  }
}
