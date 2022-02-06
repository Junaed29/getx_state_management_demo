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
            GetX<HomeController>(builder: (controller) {
              print("User status rebuild");
              return Text("User status ${controller.status.value}");
            }),
            GetX<HomeController>(builder: (controller) {
              print("User cart rebuild");
              return Text("User cart ${controller.cart.value}");
            }),
            GetX<HomeController>(builder: (controller) {
              print("Button rebuild");
              return ElevatedButton(
                  onPressed: () {
                    homeController.status.value.toLowerCase() == "online"
                        ? homeController.updateStatus("Offline")
                        : homeController.updateStatus("Online");
                  },
                  child: controller.status.toLowerCase() == "online"
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
