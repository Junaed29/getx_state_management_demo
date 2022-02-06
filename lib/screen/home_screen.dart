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
        child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("User status ${controller.status}"),
              ElevatedButton(
                  onPressed: () {
                    homeController.status.toLowerCase() == "online"
                        ? homeController.updateStatus("Offline")
                        : homeController.updateStatus("Online");
                  },
                  child: controller.status.toLowerCase() == "online"
                      ? const Text("Logout")
                      : const Text("Login")),
            ],
          );
        }),
      ),
    );
  }
}
