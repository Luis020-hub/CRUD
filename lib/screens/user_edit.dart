import 'package:flutter/material.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                "Add user",
                style: TextStyle(fontSize: 28),
              )
            ],
          ),
        ),
      ),
    );
  }
}
