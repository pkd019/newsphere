import 'dart:developer';

import 'package:get/get.dart';

class UserController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var dob = DateTime.now().obs;
  var gender = 'Male'.obs;

  void submitForm() {
    log('Name: ${name.value}');
    log('Email: ${email.value}');
    log('DOB: ${dob.value}');
    log('Gender: ${gender.value}');
  }
}
