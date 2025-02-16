import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var calendarFormat = CalendarFormat.month.obs;

  @override
  void onInit() {
    super.onInit();
    reset();
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focused) {
    startDate.value = start;
    endDate.value = end;
    focusedDay.value = focused;
  }

  void reset() {
    startDate.value = null;
    endDate.value = null;
    focusedDay.value = DateTime.now();
    calendarFormat.value = CalendarFormat.month;
  }
}
