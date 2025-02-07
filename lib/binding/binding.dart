import 'package:get/get.dart';
import 'package:smartFin/core/utils/helpers/network_manager.dart';

class GenralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}
