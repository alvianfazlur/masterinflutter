import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      setDate(picked);
    }
    update();
  }
}


