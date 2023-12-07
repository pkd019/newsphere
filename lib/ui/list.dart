import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParticipantList extends StatelessWidget {
  const ParticipantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<UserClass> userlist = _generateUserList();

    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              for (final user in userlist)
                UserClass(
                  key: ValueKey(user.name),
                  name: user.name,
                  phoneno: user.phoneno,
                  mail: user.mail,
                  dob: user.dob,
                  gender: user.gender,
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<UserClass> _generateUserList() {
    final List<UserClass> userList = [];

    for (int i = 0; i < 25; i++) {
      userList.add(
        UserClass(
          name: i % 2 == 0 ? "Archi$i" : "Archita$i",
          phoneno: '123456789$i',
          mail: 'user$i@example.com',
          dob: i / 10 < 1 ? '01/01/200$i' : '01/01/${1980 + i}',
          gender: i % 2 == 0 ? 'Male' : 'Female',
        ),
      );
    }

    return userList;
  }
}

class UserClass extends StatelessWidget {
  final String name;
  final String phoneno;
  final String mail;
  final String dob;
  final String gender;

  const UserClass({
    Key? key,
    required this.name,
    required this.phoneno,
    required this.mail,
    required this.dob,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Card(
          elevation: 5,
          color: Colors.white.withOpacity(0.8),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("name: $name"),
                  Text(
                      'Phone: $phoneno\nEmail: $mail\nDOB: $dob\nGender: $gender'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
