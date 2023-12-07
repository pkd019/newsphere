import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsphere/ui/form.dart';
import 'package:newsphere/ui/list.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("home")),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/Christmas .png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: Get.height,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(const MyForm());
                  },
                  child: const Text("sign up")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const ParticipantList());
                  },
                  child: const Text("Participant List"))
            ],
          )),
    );
  }
}
