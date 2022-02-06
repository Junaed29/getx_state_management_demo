import 'package:get/get.dart';

class HomeController extends GetxController {
  String status = "Online";

  void updateStatus(String newStatus) {
    status = newStatus;
    update();
  }
}
