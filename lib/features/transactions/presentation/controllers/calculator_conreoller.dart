import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  static CalculatorController get instance => Get.find();
  RxString amount = "0".obs;
  RxString selectedCategory = "expense".obs;

  void onKeyTap(String value) {
    if (value == "AC") {
      amount.value = "0"; // Reset value
    } else if (value == "⌫") {
      if (amount.value.length > 1) {
        amount.value = amount.value.substring(0, amount.value.length - 1);
      } else {
        amount.value = "0";
      }
    } else if (value == "=" || value == "") {
      return;
    } else {
      if (amount.value == "0" && value != ".") {
        amount.value = value;
      } else {
        amount.value += value;
      }
    }
  }

  void calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(amount.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      amount.value = eval.toString();
    } catch (e) {}
  }

  void changeCategory(String value) {
    selectedCategory.value = value;
  }
}
