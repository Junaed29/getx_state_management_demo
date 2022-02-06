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
            GetBuilder<HomeController>(
                id: "status_widget",
                builder: (controller) {
                  print("User status rebuild");
                  return Text("User status ${controller.status}");
                }),
            GetBuilder<HomeController>(
                id: "cart_widget",
                builder: (controller) {
                  print("User cart rebuild");
                  return Text("User cart ${controller.cart}");
                }),
            GetBuilder<HomeController>(
                id: "status_widget",
                builder: (controller) {
                  print("Button rebuild");
                  return ElevatedButton(
                      onPressed: () {
                        homeController.status.toLowerCase() == "online"
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
