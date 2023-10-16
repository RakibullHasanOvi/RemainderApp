import 'package:daly_task_app/providers/pickerdate_provider.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/themeprovider.dart';
import 'input_widgets.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateProvider>(builder: (context, dateProvider, child) {
      final seletedDate = dateProvider.selectedDate;
      final formattedDate = dateProvider.getFormattedDate();

      // ignore: no_leading_underscores_for_local_identifiers
      Future<void> _selectDate(BuildContext context) async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: seletedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null && pickedDate != seletedDate) {
          dateProvider.updateSelectedDate(pickedDate);
        }
      }

      return Consumer<ThemeProvider>(builder: (context, value, child) {
        return InputFeild(
          title: 'Date',
          hitn: formattedDate,
          widget: IconButton(
            onPressed: () {
              _selectDate(context);
            },
            icon: Icon(
              Icons.calendar_month_outlined,
              // ignore: unrelated_type_equality_checks
              color: value.getThemeType() == ThemeType.dark
                  ? Colors.white
                  : Colors.grey,
            ),
          ),
        );
      });
    });
  }
}
