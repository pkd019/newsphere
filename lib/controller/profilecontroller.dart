import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = "Pakaj Das".obs;
  var email = "Pkd@example.com".obs;
  var phoneNumber = "123-456-7890".obs;

  void updateProfile(String newName, String newEmail, String newPhoneNumber) {
    name.value = newName;
    email.value = newEmail;
    phoneNumber.value = newPhoneNumber;
  }
}
