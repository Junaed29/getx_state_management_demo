import 'package:get/get.dart';

class HomeController extends GetxController {
  String status = "Online";
  int cart = 0;

  void updateStatus(String newStatus) {
    status = newStatus;
    update(["status_widget"]);
  }

  void incrementCart() {
    cart++;
    update(["cart_widget"]);
  }
}
