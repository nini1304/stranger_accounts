import 'package:get/get.dart';

class Controller extends GetxController {
  var servicesId = 0.obs;
  void setServicesId(int id) {
    servicesId.value = id;
  }
}
