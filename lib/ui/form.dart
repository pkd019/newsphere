import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsphere/controller/formcontroller.dart';

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up page")),
      body: Container(
        width: double.infinity,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/Christmas .png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color:
                    Colors.white.withOpacity(0.8), // Adjust opacity as needed
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        onChanged: (value) => userController.name.value = value,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        onChanged: (value) =>
                            userController.email.value = value,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 16.0),
                      ListTile(
                        title: const Text('Date of Birth'),
                        subtitle: Text('${userController.dob.value.toLocal()}'
                            .split(' ')[0]),
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: userController.dob.value,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (selectedDate != null) {
                            userController.dob.value = selectedDate;
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        value: userController.gender.value,
                        items: ['Male', 'Female']
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            userController.gender.value = value!,
                        decoration: const InputDecoration(labelText: 'Gender'),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => userController.submitForm(),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
