import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/features/expenses/presentation/pages/callender_screen.dart';

class ExpencesController extends GetxController {
  static ExpencesController get instance => Get.find();

  Future<dynamic> selectPeriod(BuildContext context) async {
    return await showModalBottomSheet(
        backgroundColor: MyColors.darkContainer,
        isScrollControlled: true,
        context: context,
        elevation: 1.5,
        useSafeArea: true,
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width - 25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MySizes.defaultSpacing),
            topRight: Radius.circular(MySizes.defaultSpacing),
          ),
        ),
        builder: (context) => const CalendarScreen());
  }
}
