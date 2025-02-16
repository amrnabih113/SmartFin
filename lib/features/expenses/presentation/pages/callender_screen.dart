import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/styles/gradiant_text.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/formatters/dateformater.dart';
import 'package:smartFin/features/expenses/presentation/controllers/calender_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.put(CalendarController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Period", style: Theme.of(context).textTheme.titleLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: controller.reset,
                      child: GradientText(
                          text: "Reset",
                          style: Theme.of(context).textTheme.labelLarge!),
                    ),
                  ],
                ),
              ],
            ),
            Obx(() {
              final startDate = controller.startDate.value;
              final endDate = controller.endDate.value;
              return (startDate != null && endDate != null)
                  ? Text(
                      "${MyDateFormatter.dateStringMonth(startDate)} - ${MyDateFormatter.dateStringMonth(endDate)}",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : const SizedBox.shrink();
            }),
            ItemSperator.vertical(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySizes.md),
                color: MyColors.primaryBorderDark,
              ),
              padding: const EdgeInsets.all(MySizes.defaultSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => TableCalendar(
                        focusedDay: controller.focusedDay.value,
                        firstDay: DateTime(2020),
                        lastDay: DateTime(2030),
                        calendarFormat: controller.calendarFormat.value,
                        rangeSelectionMode: RangeSelectionMode.toggledOn,
                        selectedDayPredicate: (day) =>
                            isSameDay(controller.startDate.value, day) ||
                            isSameDay(controller.endDate.value, day),
                        rangeStartDay: controller.startDate.value,
                        rangeEndDay: controller.endDate.value,
                        onRangeSelected: controller.onRangeSelected,
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.white70),
                          weekendStyle: TextStyle(color: Colors.white70),
                        ),
                        calendarStyle: CalendarStyle(
                          defaultTextStyle:
                              const TextStyle(color: Colors.white),
                          weekendTextStyle:
                              const TextStyle(color: Colors.white),
                          outsideTextStyle:
                              const TextStyle(color: Colors.white38),
                          disabledTextStyle:
                              const TextStyle(color: Colors.white24),
                          rangeHighlightColor:
                              MyColors.secondaryColor.withOpacity(0.3),
                          selectedDecoration: const BoxDecoration(
                            gradient: MyColors.primaryGradient,
                            shape: BoxShape.circle,
                          ),
                          rangeStartDecoration: const BoxDecoration(
                            gradient: MyColors.primaryGradient,
                            shape: BoxShape.circle,
                          ),
                          rangeEndDecoration: const BoxDecoration(
                            gradient: MyColors.primaryGradient,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: const BoxDecoration(
                            color: MyColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          leftChevronIcon:
                              Icon(Icons.chevron_left, color: Colors.white),
                          rightChevronIcon:
                              Icon(Icons.chevron_right, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
            SectionSeperator.doubleVertical(),
            SizedBox(
              width: double.infinity,
              child: GradientElevatedButton(
                onPressed: () => Get.back(),
                child: Text(
                  "See Summary",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyColors.dark,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
