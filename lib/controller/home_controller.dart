import 'package:get/get.dart';

class HomeController extends GetxController {
  var status = "Online".obs;
  var cart = 0.obs;

  void updateStatus(String newStatus) {
    status.value = newStatus;
  }

  void incrementCart() {
    cart++;
  }
}
