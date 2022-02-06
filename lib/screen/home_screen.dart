import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management_demo/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              print("User status rebuild");
              return Text("User status ${homeController.status.value}");
            }),
            Obx(() {
              print("User cart rebuild");
              return Text("User cart ${homeController.cart.value}");
            }),
            Obx(() {
              print("Button rebuild");
              return ElevatedButton(
                  onPressed: () {
                    homeController.status.value.toLowerCase() == "online"
                        ? homeController.updateStatus("Offline")
                        : homeController.updateStatus("Online");
                  },
                  child: homeController.status.toLowerCase() == "online"
                      ? const Text("Logout")
                      : const Text("Login"));
            }),
            ElevatedButton(
                onPressed: () {
                  homeController.incrementCart();
                },
                child: Text("Cart incriment"))
          ],
        ),
      ),
    );
  }
}
