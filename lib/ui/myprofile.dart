// myprofile.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsphere/controller/profilecontroller.dart';

class MyProfile extends StatelessWidget {
  final ProfileController userController = Get.find();
  MyProfile({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ever(userController.name,
        (_) => nameController.text = userController.name.value);
    ever(userController.email,
        (_) => emailController.text = userController.email.value);
    ever(userController.phoneNumber,
        (_) => phoneNumberController.text = userController.phoneNumber.value);

    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.8,
                  child: Card(
                    color: Colors.white.withOpacity(0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Name: ${userController.name.value}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Email: ${userController.email.value}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Phone Number: ${userController.phoneNumber.value}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showUpdateDialog(context);
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update only the non-empty fields and close the dialog
                if (nameController.text.isNotEmpty) {
                  userController.updateProfile(
                      nameController.text,
                      userController.email.value,
                      userController.phoneNumber.value);
                }
                if (emailController.text.isNotEmpty) {
                  userController.updateProfile(userController.name.value,
                      emailController.text, userController.phoneNumber.value);
                }
                if (phoneNumberController.text.isNotEmpty) {
                  userController.updateProfile(userController.name.value,
                      userController.email.value, phoneNumberController.text);
                }
                Get.back();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
